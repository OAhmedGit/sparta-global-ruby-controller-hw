class PostsController < Sinatra::Base

    $posts = [{
        id: 0,
        title: "post 1",
        body: "This is the first post"
    },
    {
        id: 1,
        title: "post 2",
        body: "This is the second post"
    },
    {
        id: 2,
        title: "post 3",
        body: "This is the third post"
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
        @posts = $posts
        erb :"posts/index"
    end

    #new page
    get "/new" do
        "Show: New Form"
    end

    #show page
    get "/:id" do
        id = params[:id].to_i
        @title = id
        @header = $posts[id][:title]
        @body = $posts[id][:body]

        erb :"posts/show"
    end

    #edit page
    get "/:id/edit" do
        id = params[:id]
        "Edit: #{id}"
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
