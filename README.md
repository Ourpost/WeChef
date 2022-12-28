# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# devise 

1.  .env.sample檔案上面要再新增一個.env.development

2. .env.development貼上以下資訊，DC上面有放
DOMAIN=
MAILGUN_USERNAME=
MAILGUN_PASSWORD=

3. 安裝 gem install dotenv-rails

4. bundle install

5. yarn install 

# newebpay藍新

1. .env.development貼上以下資訊，DC上面有放
HASH_KEY=
Hash_IV=
MERCHANT_ID=

2. 信用卡測試卡號
(1) 測試環境僅接受以下的測試卡號:4000-2211-1111-1111 
(2) 測試卡號有效月年及卡片背面末三碼，請任意填寫。
(3) 系統在執行測試刷卡後，以測試授權碼回應模擬付款完成。 
(4) 以測試卡號之外的卡號資料進行交易都會失敗。 

3. 測試階段請利用ngrok產生臨時網址做測試
(1) ngrok官網網址：https://ngrok.com/
(2) ngrok設定參考資源：https://medium.com/life-after-hello-world/5%E5%88%86%E9%90%98%E5%AE%8C%E6%88%90-ngrok-%E8%A8%AD%E5%AE%9A-mac-6cedab20bc21

4. 測試時開啟兩個終端機
(1) 先開第一個終端機，輸入：foreman s
(2) 再開第二個終端機，輸入：ngrok http 3000，並用ngrok給的網址去測試