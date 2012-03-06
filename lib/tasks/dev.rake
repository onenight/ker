namespace :dev do
  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate"]
  task :rebuild => ["dev:build", "db:seed"]
  task :fake => :environment do
    require "populator"
    require "faker"
    
    User.populate 20 do |user|
      user.email = Faker::Internet.email
      user.encrypted_password = Populator.words(3)
      Post.populate 1..10 do |post|
        post.title = Populator.words(1..5).titleize
        post.content = Populator.sentences(2..10)
        post.board_id = rand(3) + 1
        post.user_id = user.id
        post.created_at = 1.years.ago..Time.now
        Comment.populate 2 do |comment|
          comment.body = Populator.words(5..10)
          comment.board_id = post.board_id
          comment.post_id = post.id
        end
      end
    end
  end
end