namespace :thorp do
  desc "THORP | Remove white spaces in username"
  task :rename_username => :environment do
    
    User.find_each do |user|
      old = user.username
      user.username = old.gsub(" ", "_")
      puts "Update [#{old}] to [#{user.username}]"
      user.save
    end
    puts "Done!"
  end
end