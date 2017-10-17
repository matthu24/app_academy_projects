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

  def self.find_by_user_id(user_id)
    users = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      WHERE
        user_id = ?
    SQL

    return nil if users.length == 0

    Question.new(users.first)
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @user_id = options['user_id']
  end

  def author
    User.find_by_id(@user_id)
  end

  def replies
    Reply.find_by_question_id(@id)
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

  def authored_replies
    Reply.find_by_user_id(self.id)
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

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @follower_id = options['follower_id']
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

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @user_id = options['user_id']
  end
end