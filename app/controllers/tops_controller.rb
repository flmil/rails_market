class TopsController < ApplicationController
  before_action :set_top, only: [:show, :edit, :update, :destroy]

  # GET /tops
  # GET /tops.json
  def index
		require 'mechanize'
		require 'open-uri'
		require 'nokogiri'
		require 'selenium-webdriver'
		require 'pp'
		#driver = Selenium::WebDriver.for :firefox # ブラウザ起動
		ua = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
		caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {binary: '/usr/bin/google-chrome-beta', args: ["--headless", "--disable-gpu", "--user-agent=#{ua}", "window-size=1280x800"]})
		driver = Selenium::WebDriver.for :chrome, desired_capabilities: caps
		driver.navigate.to 'https://rakuma.rakuten.co.jp/home/' # URLを開く
		#driver.switch_to.frame(1)               # 1つめの子フレームに移動
		#driver.switch_to.frame("frameid")       # フレームのnameを指定して移動
		#
		puts element.text
		#agent = Mechanize.new
		#page = agent.get("https://rakuma.rakuten.co.jp/search/?keyword=mac")
		#p page
		#nokogiri--------------------------------------
		#require 'open-uri'
		#require 'nokogiri'
		#url = 'https://rakuma.rakuten.co.jp/home/'
		#charset = nil
		#html = open(url) do |f|
		#	  charset = f.charset # 文字種別を取得
		#		  f.read # htmlを読み込んで変数htmlに渡す
		#end
		# htmlをパース(解析)してオブジェクトを生成
		#doc = Nokogiri::HTML.parse(html, nil, charset)
		# タイトルを表示
		#puts "----------------------"
		#p doc.title
		##------------------------------------------------
    @tops = Top.all
  end

  # GET /tops/1
  # GET /tops/1.json
  def show
  end

  # GET /tops/new
  def new
    @top = Top.new
  end

  # GET /tops/1/edit
  def edit
  end

  # POST /tops
  # POST /tops.json
  def create
    @top = Top.new(top_params)

    respond_to do |format|
      if @top.save
        format.html { redirect_to @top, notice: 'Top was successfully created.' }
        format.json { render :show, status: :created, location: @top }
      else
        format.html { render :new }
        format.json { render json: @top.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tops/1
  # PATCH/PUT /tops/1.json
  def update
    respond_to do |format|
      if @top.update(top_params)
        format.html { redirect_to @top, notice: 'Top was successfully updated.' }
        format.json { render :show, status: :ok, location: @top }
      else
        format.html { render :edit }
        format.json { render json: @top.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tops/1
  # DELETE /tops/1.json
  def destroy
    @top.destroy
    respond_to do |format|
      format.html { redirect_to tops_url, notice: 'Top was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_top
      @top = Top.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def top_params
      params.require(:top).permit(:url, :name, :money, :site)
    end
end
