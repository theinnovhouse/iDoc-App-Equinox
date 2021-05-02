# iDoc-App-Equinox

![Badge](https://img.shields.io/badge/License-MIT-yellow) 
![Badge](https://img.shields.io/badge/Xcode-12.01-green)
![badge](https://img.shields.io/badge/Swift-5.1-red)
![Badge](https://img.shields.io/badge/Mongo-DB-yellowgreen)
![Badge](https://img.shields.io/badge/Express-Backend-yellowgreen)
![badge](https://img.shields.io/badge/iOS-14+-blue)
![Badge](https://img.shields.io/badge/COVID-Detection-yellowgreen)
![badge](https://img.shields.io/badge/SkinCancer-Detection-red)
![Badge](https://img.shields.io/badge/NailDiseases-Detection-yellowGreen)
![Badge](https://img.shields.io/badge/TeethDiseases-Detection-yellow) 
![badge](https://img.shields.io/badge/Medicine-Bot-blue)
![badge](https://img.shields.io/badge/Report-History-orange)
![badges](https://img.shields.io/badge/Custom-Backend-yellow)

# Introduction ⚒  
iDoc is a medical assistant app used to diagnose various diseases, suggest medical help, buy online medicines and to save your report history. This app works on various types of high level Machine Learning model. The Machine Learning model learns the input image and shows you result. The app consists of an medical bot which help you in identifying various medicines. The app helps to know the top doctors in your area and book an appointment with them. The report section which works on a custom database save your appointment reports with all the details. Even if you book a doctor other than from Doctor Bot then also you can add your report physically which will be encrypted and saved in the app. The app provides a Medi-Store from where you can order your medicines.

# Inspiration ❤️
The Idea behind construction of this app was to remove mental pressure of people when they get affected by diseases. During this pandemic when people are not able to visit hospitals frequently they can use this app to identify what diseases are they affected from. The app provides 89.93% accurate result. The app even provides medicinal suggestions according to the symptoms you have. During this high time when people fear to go hospitals, they can have the same guidance and suggestions being at home using Doctor Bot. 

We thought to take it to another level by adding a Medi-Store. The Medi-Store is an online medical store from where you can order medicines. In the Medi-Store you don't need to add your prescription or order physically, the doctor who diagnosed you, will add the prescription by himself and the medicine will be delivered to your house. The bot remembers your medicine dosage cycle to expiration such that it would notify you when new medicines are to be ordered as well as the warning notification for expiration of medicine. 

So our idea was to create an app which provides 100% guidance and suggestions to a patient regardless of going to the hospital, because during this pandemic going out is more riskier, so we created this app which would take care of your medical related problem by being at home.

# How we built it 
* So our app basically consists of 4 main parts
1. Mobile Application 
2. Web Application 
3. Backend 
4. ML Model

* Our mobile application is built on Swift language which is compiled using Xcode
* website---------------------------------
* Our backend is made on Firebase and Nodejs. So we have used firebase for authentication and Custom backend for saving users data.
* Our ML model is built using CoreML and Swift laguage .

# Impact on Society 🌏
This app have a great impact on our society:
* Reduction in use of carbon films. 
* Secure and safe storage of your report.
* Less contact between people.
* Smart Notification to alert dosage timings .
* Less mental pressure.
* Reduction in capital spent on hospitals.
* Record history of diagnostic checkups.
* Record history of previous reports.

# Challenges we ran off

* So inintially we needed to figure out how our ML model will work on any image with high accuracy as well as high precision. That took us quite a bit to figure out how we can achieve our desired result.
* Secondly our ML model accepts image in a format called CVPixelBuffer so we were supposed to convert our jpeg mages to CVPixelBuffer and that was a challenging task for us.
* Then as we considered user privacy to be our foremost priority we were supposed to build a custom backend so that the users data always remains to him and its not shared to any third party server.
* website---------------------------------

# Final product


# Database 🎚
* The whole app works on Firebase and custom database. 
* For authentication we are using Firebase and to save user reports we have used our custom built backend.
* The backend is made with MonoDB and Express and written on NodeJS.

# Whats Next for i-Doc ?

# How To Use 🛑 
### The app consists of four main sections:
1. Diagnostic Section 
* The diagnostic section consists of various disease diagnosing units. Primarily we have % major units:  <br>
 a. COVID Detection <br>
 b. Teeth Disease  <br>
 c. Skin Disease  <br>
 d. Skin cancer  <br>
 e. Nail Disease  <br>
 
2. Medi-Bot
* Medi-Bot is a AI based assitant which would explain you why a particular medicine is given to you and what are its effect on your body. Even the Bot tells you the various kinds of alternate medicines you can get.

3. Diagnostic History
* The History section consists of your previous diagnosis details. Forgot about your last diagnosis , get to the history to know about it. We keep your records safe in our app.

4. Report History
* Irritated with lots of hospital files, use "Report History", we provide you a perfect place where you can save all your previous reports and details. Getover with the mess of handling many files, save your data in Report History and we assure you that your data is protected with Doctor Bot.

* Even your past appointmets with all its detail will be saved in the report section.

5. Medi-Store
* Medi-Store is a onine medical store powered by DoctorBot. Here you can purchase your medicines as well as various medical things. The AI bot saves your prescription provided by doctor and delivers it to your house. The AI bot remebers all your medicinal details. It save your dosage cycle to medicine expiration and when time arrives it notifies you with warning for medicine expiry and even when is its the time for your dosage.

* The AI Bot remebers when your medicine cycle completes and orders a new one for you.

6. Doctor Section
* Here the user can get a simplified yet detailed view of top doctors in his area. The list shows the user the particular Doctor's specialisation and even their working time so that when emergency arrives the user can have a quick glance on the app and select his most suitable doctor.

# Snapshots of App 📸

<p align = "center">

![Untitled design-36](https://user-images.githubusercontent.com/56252259/116794668-5cbfa780-aaec-11eb-9bc9-76fc634fa80b.png)
![Untitled design-37](https://user-images.githubusercontent.com/56252259/116794669-5e896b00-aaec-11eb-8d91-65e6bd7437fc.png)
![Untitled design-35](https://user-images.githubusercontent.com/56252259/116794670-60532e80-aaec-11eb-911a-cdc3fafdfb0f.png)

</p>


# Inbuilt Libraries Used 📒 

* UIKit <br>
* CoreML
* Message UI
* AVKit 
* Foundation

# External Libraries Used 📦

* [Loafjet](https://github.com/gokulnair2001/Loafjet): This library is made by one of our developer.
* [Alamofire](https://github.com/Alamofire/Alamofire)

# Key Features 🔐
* Fast and Secure Diagnosis 
* Fall detection 
* SOS Calling
* Save Money
* Medical assistance on your hand
* Report storage locker
* Biometric Authentication
* Diagnosis History

# License ⚖️  

MIT License<br> Please read the [License](https://github.com/theinnovhouse/iDoc-App-Equinox/blob/master/LICENSE) file for details.

# Credits ⭐️
* ML Model Dataset credits :[kaggle](https://www.kaggle.com/datasets) 
glad to work with you.

**Drop a star ⭐ if you find this project interesting!**

<p align="center" width="100%">
   Made with ❤️ in 🇮🇳 By The Innov House
</p>


