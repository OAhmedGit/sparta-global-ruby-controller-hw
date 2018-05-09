class PostsController < Sinatra::Base

    $users = [{
        first_name: "Osama",
        last_name: "Ahmed",
        age: 24,
        email: "osama@gmail.com"
    },
    {
      first_name: "Jira",
      last_name: "W",
      age: 24,
      email: "jira@gmail.com"
    },
    {
      first_name: "Alex",
      last_name: "Mentzgen",
      age: 24,
      email: "alex@gmail.com"
    },
    {
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
        @users = $users
        erb :"posts/index"
    end

    #new page
    get "/new" do
        erb :"posts/new"
    end

    #show page
    get "/:id" do
        id = params[:id].to_i
        @title = $users[id][:first_name]
        @name = $users[id][:first_name]
        @email = $users[id][:email]
        @age = $users[id][:age]

        erb :"posts/show"
    end

    #edit page
    get "/:id/edit" do
      id = params[:id].to_i
      @title = $users[id][:first_name]
      @name = $users[id][:first_name]
      @email = $users[id][:email]
      @age = $users[id][:age]

      erb :"posts/edit"
    end

    #create page
    post "/" do
        "create Page"
    end

    #delete page
    delete "/:id" do
        id = params[:id]
        "Delete: #{id}"
    end

    #update page
    patch "/:id" do
        id = params[:id]
        "Update: #{id}"
    end
end
