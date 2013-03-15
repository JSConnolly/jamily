get '/posts' do
  erb :"_posts"
end


get '/posts/new' do
  erb :"new"
end


post '/posts/new' do
  @post = Post.create( params[:post] )
  if params[:tags]
    parse_tags( params[:tags] ).each do |tag|
      @post.tags << tag
    end
  end

  redirect "/posts/#{@post.id}}"
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



