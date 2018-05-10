class Post
  attr_accessor :id, :first_name, :last_name, :email, :age

  def self.open_connection
    return conn = PG.connect(dbname: "blog")
  end

  def self.all
    conn = self.open_connection
    sql = "SELECT * FROM post ORDER BY id"
    results = conn.exec(sql)

    posts = results.map do |result|
      self.hydrate(result)
    end

    return posts
  end

  def self.hydrate (post_data)
    post = Post.new
    post.id = post_data["id"]
    post.first_name = post_data["first_name"]
    post.last_name = post_data["last_name"]
    post.email = post_data["email"]
    post.age = post_data["age"]

    return post
  end

  def self.find (id)
    conn = self.open_connection
    sql = "SELECT * FROM post WHERE id=" + id
    results = conn.exec(sql)

    posts = results.map do |result|
      self.hydrate(result)
    end

    return posts[0]
  end

  def save
    conn = Post.open_connection
    if(!self.id)
      sql = "INSERT INTO post (first_name, last_name, email, age) VALUES ('#{self.first_name}', '#{self.last_name}', '#{self.email}', '#{self.age}')"

    else
      sql = "UPDATE post SET first_name='#{self.first_name}', last_name='#{self.last_name}', email='#{self.email}', age='#{self.age}' WHERE id=#{self.id}"
    end

    conn.exec(sql)
  end

  def self.destroy (id)
    conn = Post.open_connection

    sql = "DELETE FROM post WHERE id=" + id

    conn.exec(sql)
  end

end
