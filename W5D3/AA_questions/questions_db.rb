require 'sqlite3'
require 'singleton'

class QDB < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class Users

    attr_reader :fname, :lname, :u_id

    def self.all
        data = QDB.instance.execute("SELECT * FROM users")
        data.map { |ele| Users.new(ele) }
    end
    
    def self.find_by_id(id)
        QDB.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            users
        WHERE
            u_id = ?;
        SQL
    end

    def self.find_by_name(fname,lname)
        QDB.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users
        WHERE
            fname= ? AND lname=? ;
        SQL
    end

    def initialize(hash)
        @u_id = hash['u_id']
        @fname = hash['fname']
        @lname = hash['lname']
    end

    def authored_questions
        Questions.find_by_author_id(u_id)
    end

    def authored_replies
        Replies.find_by_user_id(u_id)
    end
end

class Questions

    attr_reader :author_id

    def self.all
        data = QDB.instance.execute("SELECT * FROM questions")
        data.map { |ele| Questions.new(ele) }
    end

    def self.find_by_id(id)
        QDB.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            questions
        WHERE
            q_id = ?;
        SQL
    end

    def self.find_by_author_id(author_id)
        QDB.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                author_id = ?;
        SQL
    end

    def initialize(hash)
        @q_id = hash['q_id']
        @title = hash['title']
        @body = hash['body']
        @author_id = hash['author_id']
    end

    def author
        Users.all.each do |user|
            if author_id == user.u_id
                fname = user.fname
                lname = user.lname
                return fname + " " + lname
            end
        end
    end

end

class QuestionFollows
    def self.all
        data = QDB.instance.execute("SELECT * FROM question_follows")
        data.map { |ele| QuestionFollows.new(ele) }
    end

    def self.find_by_id(id)
        QDB.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            question_follows
        WHERE
            id = ?;
        SQL
    end

    def initialize(hash)
        @id = hash['id']
        @follower_user_id = hash['follower_user_id']
        @initial_q_id = hash['initial_q_id']
    end
end

class Replies
    def self.all
        data = QDB.instance.execute("SELECT * FROM replies")
        data.map { |ele| Replies.new(ele) }
    end

    def self.find_by_id(id)
        QDB.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            replies
        WHERE
            reply_id = ?;
        SQL
    end

    def self.find_by_user_id(u_id)
        QDB.instance.execute(<<-SQL, u_id)
        SELECT
            *
        FROM
            replies
        WHERE
            reply_user_id = ?
        SQL
    end

    def self.find_by_question_id(q_id)
        QDB.instance.execute(<<-SQL, q_id)
        SELECT
            *
        FROM
            replies
        WHERE
            subject_q_id = ?
        SQL
    end

    def initialize(hash)
        @reply_id = hash['reply_id']
        @subject_q_id = hash['subject_q_id']
        @parent_id = hash['parent_id']
        @reply_user_id = hash['reply_user_id']
        @reply_body = hash['reply_body']
    end

    def author
        Users.all.each do |user|
            if reply_user_id == user.u_id
                fname = user.fname
                lname = user.lname
                return fname + " " + lname
            end
        end
    end

    private

    attr_reader :reply_user_id
end

class QuestionLikes
    def self.all
        data = QDB.instance.execute("SELECT * FROM question_likes")
        data.map { |ele| QuestionLikes.new(ele) }
    end

    def self.find_by_id(id)
        QDB.instance.execute(<<-SQL, id)
        SELECT
            *
        FROM
            question_likes
        WHERE
            like_id = ?;
        SQL
    end

    def initialize(hash)
        @like_id = hash['like_id']
        @like_user_id = hash['like_user_id']
        @like_q_id = hash['like_q_id']
    end

end




test = Replies.new({'reply_id'=>3, 'subject_q_id'=>5, 'parent_id'=>nil, 'reply_user_id'=>4, 'reply_body'=>'But what about my money?'})
p test.author