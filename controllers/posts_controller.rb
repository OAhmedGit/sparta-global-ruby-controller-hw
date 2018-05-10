class PostsController < Sinatra::Base

    $users = [{
        id: 0,
        first_name: "Osama",
        last_name: "Ahmed",
        age: 24,
        email: "osama@gmail.com"
    },
    {
      id: 1,
      first_name: "Jira",
      last_name: "W",
      age: 24,
      email: "jira@gmail.com"
    },
    {
      id: 2,
      first_name: "Alex",
      last_name: "Mentzgen",
      age: 24,
      email: "alex@gmail.com"
    },
    {
      id: 3,
      first_name: "Bikesh",
      last_name: "Rana",
      age: 24,
      email: "bikesh@gmail.com"
    }]

    # sets root as the parent-directory of the current file
    set :root, File.join(File.dirname(__FILE__), '..')

    # sets the view directory correctly
    set :views, Proc.new { File.join(root, "views") }

    configure :development do
      register Sinatra::Reloader
    end

    #index page
    get "/" do
      @title = "Blog Posts"
      @users = Post.all
      erb :"posts/index"
    end

    #new page
    get "/new" do
      @post = Post.new
      erb :"posts/new"
    end

    #show page
    get "/:id" do
        id = params[:id]
        @post = Post.find(id)

        erb :"posts/show"
    end

    #edit page
    get "/:id/edit" do
      id = params[:id]
      @post = Post.find(id)

      erb :"posts/edit"
    end

    #create page
    post "/" do
      post = Post.new

      post.first_name = params[:first_name]
      post.last_name = params[:last_name]
      post.age = params[:age]
      post.email = params[:email]

      post.save

      redirect "/"

    end

    #delete page
    delete "/:id" do
        id = params[:id]

        Post.destroy(id)

        redirect "/"
    end

    #update page
    put "/:id" do

        id = params[:id]
        post = Post.find(id)

        post.first_name = params[:first_name]
        post.last_name = params[:last_name]
        post.email = params[:email]
        post.age = params[:age]

        post.save

        redirect "/"
    end
end
