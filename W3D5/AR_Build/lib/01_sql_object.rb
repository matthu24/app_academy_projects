require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  #return an array with the names of the table's columns
  def self.columns
    # ...
    #to make sure don't hit the db twice
   return @columns if @columns
   @columns  = DBConnection.execute2(<<-SQL).first
     SELECT
       *
     FROM
        #{table_name}
    SQL
  #  cols.map!(&:to_sym)
  #map everything to the symbol
  @columns.map!{|el| el.to_sym}


  end






  #sets attributes hash
  def self.finalize!
    #call columns and iterate through
    #and set atttributes
    self.columns.each do |name|

      define_method(name) do
        self.attributes[name]
      end

      define_method("#{name}=") do |value|
        self.attributes[name] = value
      end

    end
  end

  #setter method to set the table
  def self.table_name=(table_name)
    # ...
    @table_name = table_name
 end

 def self.table_name
    @table_name || self.name.underscore.pluralize
  #@table_name
 end

 def self.all
   results = DBConnection.execute(<<-SQL)
     SELECT
       #{table_name}.*
     FROM
       #{table_name}
   SQL

   parse_all(results)

  end


  def self.parse_all(results)
    # ...
    #create new instance of human objects

  end

  def self.find(id)
    # ...
    results = DBConnection.execute(<<-SQL)
      SELECT
        #{table_name}.*
      FROM
        #{table_name}
      WHERE
        #{table_name}.id = ?
    SQL
    parse_all(results)


  end

  def initialize(params = {})
    # ...
    params.each do |attr_name,value|
      attr_name = attr_name.to_sym

      #Set the attribute by calling the setter method. Use #send; avoid using @attributes or #attributes inside #initialize
      if self.class.columns.include?(attr_name)
        self.send("#{attr_name}=", value)
      else
        raise "unknown attribute '#{attr_name}'"
      end
    end
  end

  def attributes
    # ...
    @attributes ||= Hash.new

  end

  def attribute_values
    # ...
    #columns is an array of methods?
    @attributes.values
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
