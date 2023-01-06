# Wechef  -後台系統的最佳選擇

<img src="" width="100%" />

# 專案簡介

> 本專案以 Ruby 版本 3.1.2；Rails 6.1.7 進行開發

WeChef  是融合了POST系統跟客人線上點餐服務的平台 ，想像一下：

以往我們是客人時，總是要拿紙本菜單到櫃檯結帳，
當是店家時總要到處走動點餐，造成不必要的人力成本開銷。

WeChef 提供了 ：
客人： 即時線上點餐、付款
店家： 即時接收訂單、快速上下架商品

在這後疫情時代中，提供了雙方零接觸服務，
並幫店家省下了不必要的人力開銷，更專注於餐點的製作。

# 重要功能介紹

## 1. 使用線上第三方金流 
透過第三方金流使用這可以在這後疫情的時態中更安全 更便利的支付

## 2. 第三方登入功能
透過第三方登入讓使用者體驗更順暢也更具便利性

## 3. 店家管理介面
老闆可以同時擁有多間商店同步管理，即時編輯商家降低創業門檻一人也可以當老闆

## 4. 新增菜自動生成前台網站
各店可以隨時調整菜色及菜品即時編輯更新，並直接生成顧客點餐畫面

## 5. 自動生成QR code功能
當座位建立完成之後，直接生成QR code對應餐桌

## 6. 訂單即時顯示功能
客人點餐付款完畢後，訂單即時生成，店家更專注於餐點製作訂單不漏接


# 如何使用此專案

### 步驟 1：安裝專案 

> 執行 $ bundle install ；
> 執行 $ yarn/npm install ;


### 步驟 2：建立資料庫 

> 執行 $ rails db:create 
> 執行 $ rails db:migrate 


## 步驟 3：加入所需環境變數
可參照.env.sample 檔案並在vscode上新增一個檔案並填入所需 > .env.development
（第三方金流、AWS S3、GoogleAPI、Mailgun）

步驟 4：啟動 localhost:3000
執行 $ foreman s ；Run $ foreman s

## 以下注意事項

### 信用卡測試卡號
(1) 測試環境僅接受以下的測試卡號:4000-2211-1111-1111 
(2) 測試卡號有效月年及卡片背面末三碼，請任意填寫。
(3) 系統在執行測試刷卡後，以測試授權碼回應模擬付款完成。 
(4) 以測試卡號之外的卡號資料進行交易都會失敗。 

### 測試階段請利用ngrok產生臨時網址做測試
(1) ngrok官網網址：https://ngrok.com/
(2) ngrok設定參考資源：https://medium.com/life-after-hello-world/5%E5%88%86%E9%90%98%E5%AE%8C%E6%88%90-ngrok-%E8%A8%AD%E5%AE%9A-mac-6cedab20bc21

### 測試時開啟兩個終端機
(1) 先開第一個終端機，輸入：foreman s
(2) 再開第二個終端機，輸入：ngrok http 3000，並用ngrok給的網址去測試

# 組員介紹

## 吳侑庭 Tim

* PosgreSQL 資料庫
* 串接 AWS S3 
* Google 第三方登入
* 路徑優化 
* ER圖
* 前端視覺設計
* 前端 RWD 
* UX/UI 設計
* i18n 訊息中文化 
* Heroku部署
* Action cable即時訂單顯示
* 商店 商品 分類 桌位 CRUD

**GitHub: https://github.com/timwu0109**
**Email: mr.oldfive@gmail.com**


## 邱志壅 JASON

* PosgreSQL 資料庫
* 藍新金流串接 
* 購物車功能
* 路徑優化 
* ER圖
* 前端視覺設計
* 前端 RWD 
* UX/UI 設計
* Action cable即時訂單顯示
* 會員 購物車 餐桌 CRUD

**GitHub: https://github.com/Jason0227**
**Email: g57982702@gmail.com**