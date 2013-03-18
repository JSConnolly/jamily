get '/posts' do
  @posts = Post.all
  erb :posts
end


get '/posts/new' do
  @errors = session[:errors]
  session[:errors] = nil
  erb :"new"
end


post '/posts/new' do
  @post = Post.new( params[:post] )
  if @post.valid?
    if params[:tags]
      parse_tags( params[:tags] ).each do |tag|
        @post.tags << tag
      end
    end
    @post.save
    redirect "/posts/#{@post.id}}"
  else
    session[:errors] = @post.errors.full_messages
    redirect "/posts/new"
  end
end


get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :"_edit_post"
end


get '/posts/:id' do
  @post = Post.find(params[:id])
  erb :"_post_detail"
end


put '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes( params[:post] )
  if params[:tags]
    @post.tags += parse_tags( params[:tags] )
  end
  redirect "/posts/#{params[:id]}"
end


delete '/posts/:id' do
  Post.find(params[:id]).delete
  redirect '/'
end



