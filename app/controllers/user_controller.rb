class UserController < ApplicationController
  def index
    @users = User.all
  end

  def new
    
  end

  def create
    email = params[:email]
    pw = params[:password]
    
    User.create(
      email: email,
      password: pw
      )
    redirect_to '/user/index'
  end

  def show
    @user = User.find(params[:id])
  end
  
  def login
    
  end
  
  def login_process
    
    pw = params[:password]
    
    user = User.find_by(email: params[:email])

    if user
      if user.password == pw
        session[:user_id] = user.id
        session[:user_email] = user.email
        flash[:notice] = '로그인이 되었습니다.'
        redirect_to '/'
      else
        flash[:notice]='Wrong PassWord'
        redirect_to '/user/login'
      end
    else
      flash[:notice] = "없는 정보이거나 이메일이 잘못됐습니다."
      redirect_to '/user/new'
    end
    
  end
  
  def logout
      flash[:notice] = "로그아웃 되었습니다."
      session.clear
      redirect_to '/'
    
  end
  
end
