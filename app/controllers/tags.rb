get '/tags/:tag_id' do
  @tag = Tag.find(params[:tag_id])
  @posts = @tag.posts
  erb :tagged
end