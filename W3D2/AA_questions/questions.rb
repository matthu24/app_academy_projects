require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end






class Question
  attr_accessor :id, :title, :body, :user_id

  def self.find_by_id(id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL

    return nil if questions.length == 0

    Question.new(questions.first)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end



  def self.find_by_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL

    return nil if questions.length == 0

    questions.map {|question| Question.new(question)}
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def likers
    QuestionLike.likers_for_question_id(@id)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@id)
  end

  def author
    User.find_by_id(@user_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

end







class User
  attr_accessor :id, :fname, :lname

  def self.find_by_id(id)
    users = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    return nil if users.length == 0

    User.new(users.first)
  end

  def self.find_by_name(fname, lname)
    users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ? AND lname = ?
    SQL

    return nil if users.length == 0

    User.new(users.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end

  def authored_questions
    Question.find_by_user_id(self.id)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(self.id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end


end






class QuestionFollow
  attr_accessor :id, :question_id, :follower_id

  def self.find_by_id(id)
    question_follows = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_follows
      WHERE
        id = ?
    SQL

    return nil if question_follows.length == 0

    QuestionFollow.new(question_follows.first)
  end

  def self.most_followed_questions(n)

    most_followed_questions = QuestionsDatabase.instance.execute(<<-SQL,n)
      SELECT
        -- question_id
        questions.id, questions.title,questions.body,questions.user_id
      FROM
        questions
      JOIN
        question_follows ON questions.id = question_id


      GROUP BY
       question_id
      ORDER BY
        COUNT(question_id) DESC
      LIMIT
        ?


    SQL

    return nil if most_followed_questions.length == 0
    # most_followed_questions.map {|question| Question.find_by_id(question['question_id'])}
    most_followed_questions.map {|question| Question.new(question)}
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @follower_id = options['follower_id']
  end

  def self.followers_for_question_id(question_id)
    followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        follower_id
      FROM
        question_follows
      JOIN
        users ON question_follows.follower_id = users.id
      WHERE
        question_id = ?


    SQL

    return nil if followers.length == 0
    followers.map {|follower| User.find_by_id(follower['follower_id'])}
  end

  def self.followed_questions_for_user_id(follower_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, follower_id)
      SELECT
        -- question_id
        questions.id,questions.title,questions.body,questions.user_id
      FROM
        question_follows
      JOIN
        questions ON questions.id = question_follows.question_id
      WHERE
        follower_id = ?
    SQL

    return nil if questions.length == 0
    # questions.map {|question| Question.find_by_id(question['question_id'])}
    questions.map {|question| Question.new(question)}

  end

end







class Reply
  attr_accessor :id, :question_id, :parent_id, :user_id, :body

  def self.find_by_id(id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        replies
      WHERE
        id = ?
    SQL

    return nil if replies.length == 0

    Reply.new(replies.first)
  end

  def self.find_by_user_id(user_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        replies
      WHERE
        user_id = ?
    SQL

    return nil if replies.length == 0

    replies.map { |reply| Reply.new(reply) }
  end

  def self.find_by_question_id(question_id)
    replies = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
       *
      FROM
        replies
      WHERE
        question_id = ?
    SQL

    return nil if replies.length == 0

    replies.map { |reply| Reply.new(reply) }
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_id = options['parent_id']
    @user_id = options['user_id']
    @body = options['body']
  end

  def author
    User.find_by_id(@user_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_id)
  end

  def child_replies
    children = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        *
      FROM
        replies
      WHERE
        parent_id = ?
    SQL

    return nil if children.length == 0

    children.map { |child| Reply.new(child) }
  end
end






class QuestionLike
  attr_accessor :id, :question_id, :user_id

  def self.find_by_id(id)
    question_likes = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        question_likes
      WHERE
        id = ?
    SQL

    return nil if question_likes.length == 0

    QuestionLike.new(question_likes.first)
  end


  def self.likers_for_question_id(question_id)
    likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        user_id, users.fname, users.lname
      FROM
        question_likes
      JOIN
        users ON users.id = user_id
      WHERE
        question_id = ?
    SQL
    return nil if likers.length == 0
    likers.map{|liker| User.new(liker)}
  end

  def self.num_likes_for_question_id(question_id)
    likes = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        COUNT(question_id) AS count
      FROM
        question_likes
      WHERE
        question_id = ?


    SQL
    return nil if likes.length == 0
    likes.first['count']


  end

  def self.liked_questions_for_user_id(user_id)
    questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        -- question_id
        questions.id,questions.title,questions.body,questions.user_id
      FROM
        question_likes
      JOIN
        questions ON questions.id = question_likes.question_id
      WHERE
        user_id = ?
    SQL
    return nil if questions.length == 0
    # questions.map{|question| Question.find_by_id(question['question_id'])}
    questions.map{|question| Question.new(question)}
  end

  def self.most_liked_questions(n)
    questions = QuestionsDatabase.instance.execute(<<-SQL, n)
      SELECT
        question_id
      FROM
        question_likes
      GROUP BY
        question_id
      ORDER BY
        COUNT(question_id) DESC
      LIMIT
        ?



    SQL
    return nil if questions.length == 0
    questions.map{|question| Question.find_by_id(question['question_id'])}

  end



  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end
