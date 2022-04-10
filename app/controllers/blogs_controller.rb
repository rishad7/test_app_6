class BlogsController < ApplicationController
    before_action :set_blog, only: %i[ show edit update destroy ] 

    def index
        @blogs = Blog.all
    end

    def show
    end

    def new
        @blog = Blog.new
    end

    def edit
    end

    def create 
        @blog = Blog.new(blog_params)
        if @blog.save
            # redirect_to blog_path(@blog)
            # redirect_to blog_url(@blog)
            flash[:notice] = "Blog was created successfully."
            redirect_to @blog
        else
            render 'new'
        end
    end

    def update
        if @blog.update(blog_params)
            flash[:notice] = "Blog was updated successfully."
            redirect_to @blog
        else
            render 'edit'
        end
    end

    def destroy
        @blog.destroy
        flash[:notice] = "Blog was deleted successfully."
        redirect_to blogs_url
    end

    private

    def set_blog
        @blog = Blog.find(params[:id])
    end

    def blog_params
        params.require(:blog).permit(:title, :description)
    end
end