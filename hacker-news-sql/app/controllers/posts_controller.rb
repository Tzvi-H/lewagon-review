class PostsController
  def initialize
    @view = PostsView.new
  end

  def index
    @view.display(Post.all)
  end

  def create
    title = @view.ask("what is the title?")
    url = @view.ask("what is the url?")
    post = Post.new(title: title, url: url, votes: 0)
    post.save
  end

  def update
    @view.display(Post.all)
    index = @view.ask('what is the number?').to_i - 1
    post = Post.all[index]
    post_instance = Post.find(post["id"])

    post_instance.title = @view.ask("what is the new title?")
    post_instance.url = @view.ask("what is the new url?")
    post_instance.save
  end

  def destroy
    @view.display(Post.all)
    index = @view.ask('what is the number?').to_i - 1
    post = Post.all[index]
    post_instance = Post.find(post["id"])

    post_instance.destroy
  end

  def upvote
    @view.display(Post.all)
    index = @view.ask('what is the number?').to_i - 1
    
    post = Post.all[index]
    
    post_instance = Post.find(post["id"])
    post_instance.votes = post_instance.votes + 1
    post_instance.save
  end
end