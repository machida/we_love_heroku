class InsertGithubToProvider < ActiveRecord::Migration
  def up
    execute "INSERT INTO providers(id, name, created_at, updated_at)VALUES(3, 'github', NOW(), NOW())"
  end

  def down
    execute "INSERT INTO providers(id, name, created_at, updated_at)VALUES(3, 'github', NOW(), NOW())"
  end
end
