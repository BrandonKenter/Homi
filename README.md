# HÖmi

Hello, welcome to HÖmi, this README file provides environment setup procedure & usage instruction.  

## Intro

Our full stack is as below, so we have to install & setup the related applications.

            F/E                            B/E
    Java script/html/css -> java -- JDBC (link by Tomcat) -- MySQL


## Set up instruction

1.MySQL setup

1.1	install MySQL 8.0.19 (Download MySQL: http://tiny.cc/6f4kuz)

*Set password as 123456, it would be convenitent for link with tomcat later.

1.2	Download my.ini file and move it to MySQL 8.0.19 directory (Download my.ini: http://tiny.cc/jg1kuz)

1.3	To access MySQL directory: right-click on "Finder" -> "go to file"

-> type the path: "/usr/local/mysql-8.0.19-macos10.15-x86_64"

1.4	Open terminal -> input command "echo $SHELL" -> check shell type is bash or zsh

![image](https://user-images.githubusercontent.com/91846668/136494546-321b2f53-67c9-4aca-8a87-16d42e80c129.png)

1.5	Go the user fold find the file (if your shell type is : bash -> .bash_profile or zsh -> .zshrc) 

![image](https://user-images.githubusercontent.com/91846668/136494590-c9cf1724-0214-4974-81c6-be9fa4f5779c.png)

*the file may be a hidden file, use "command + shift + ." to view the file
  
1.6	Open the file and add the line below in the file.

export PATH=/usr/local/mysql-8.0.19-macos10.15-x86_64/bin:$PATH

![image](https://user-images.githubusercontent.com/91846668/136631020-7add756f-25bd-4d76-ad15-ae4591187b52.png)
 
1.7	Go to terminal use command “mysqld --initialize –console” to initialize MySQL

(it would generate a temporary password, but just ignore it. The default password would be set when installing MySQL, remember the password you set.)

![image](https://user-images.githubusercontent.com/91846668/136494749-9ce62a52-7bbb-4059-955c-6ad26aed4d44.png)

1.8	Use command “mysqld --install” to install

![image](https://user-images.githubusercontent.com/91846668/136494781-e497350b-6502-402d-997c-9f66c0b43fbb.png)
 
1.9	Use command “mysqld” to open MySQL service

![image](https://user-images.githubusercontent.com/91846668/136494799-706f6eb4-eb5e-46fc-bbf4-d41438b92a9f.png)

1.10	Install MySQL workbench (Download MySQL workbench http://tiny.cc/7h1kuz)

1.11	Open MySQL workbench -> Edit connection

![image](https://user-images.githubusercontent.com/91846668/136494886-4c57270f-f2f7-4175-be9d-68bf1835e295.png)

1.12	Click “Store in Keychain” -> input the password you set before -> Test connection (it would show successful message if it works)

***If your password is not set 123456, please see 2.13 instruction.**

![image](https://user-images.githubusercontent.com/91846668/136494913-6188ccf9-c057-4a11-a129-b1f2629d05bc.png)

1.13	(Import tables) After connection -> go to scheme tab -> right-click on the left box -> create schema

-> name the schema **HOMII** -> click add SQL button on the up-left side 

-> copy the words from the link below -> paste to the sheet -> click execute button (flash sign) 

-> click refresh button on the up-right side of left box

(Download MySQL script: http://tiny.cc/6mpluz)

![image](https://user-images.githubusercontent.com/91846668/136495072-74191733-237f-46ae-8a96-1138f1d8d4ea.png)

2.Eclipse & tomcat setup
	
2.1 install Eclipse EE (Download Eclipse: http://tiny.cc/ug1kuz)

2.2 install java JDK 1.8.0_201 (Download JDK: http://tiny.cc/bf4kuz)

2.3 Create an independent directory for this project -> copy the project folder & tomcat folder to the directory

(project folder: from Github / tomcat folder:download Tomcat v9 from http://tiny.cc/wn2kuz)

***If your MySQL root password is not 123456, please go to conf file -> open context.xml -> find password="123456" modify to your password 
 after download tomcat.**

2.4 Open Eclipse and choose the directory as workplace

2.5 Go to preference to set up Tomcat connection 

![image](https://user-images.githubusercontent.com/91846668/136631122-a5b5d9dc-bffe-4b63-a420-36002c1f2642.png)
 
Click add to add server

![image](https://user-images.githubusercontent.com/91846668/136496464-bebeb4be-857c-411e-b588-6687c081ef67.png)

Choose v9.0

![image](https://user-images.githubusercontent.com/91846668/136496416-c431768a-53e7-4ead-9140-a67c1384934b.png)

Choose tomcat directory which would be in your eclipse workplace folder for this project -> Choose Java SE 8[1.8.0_201]

![image](https://user-images.githubusercontent.com/91846668/136495484-1ed16d08-0a0c-4822-b183-9f7d07257a8d.png)

*if there is no Java SE 8 in the option -> click installed JREs to find the version

![image](https://user-images.githubusercontent.com/91846668/136495530-33016fcb-d68a-49ef-9de9-9eb5e0412022.png)

2.6 If there no error message -> run index.jsp -> the website would be opened!
 
![image](https://user-images.githubusercontent.com/91846668/136495726-d87dd890-406f-4f67-8564-32d71dea6bdc.png)


2.7 Exceptions: 

There may still have error after doing the procedure above, if it is, please check

*Right clickc HOMI -> Configure Build Path

![image](https://user-images.githubusercontent.com/91846668/136495775-895774a0-fdd0-4065-9073-a9ac1166b2b2.png)
 
*Check if some error in libraries -> if yes, re-add the JARs which show error

(Download javax.mail.jar: http://tiny.cc/zn2kuz)

(Download jstl.jar: http://tiny.cc/2o2kuz)

*Check if the JRE Library is JavaSE 1.8 -> if not, edit it to correct version
 
![image](https://user-images.githubusercontent.com/91846668/136495868-f62c9b8f-f265-4c49-96d6-c9d257a7aebc.png)


2.8 Download Google Cloud Tools for Eclipse

In Eclipse, select Help -> Eclipse Marketplace -> Google Cloud Tools for Eclipse 1.8.4 -> Install -> Confirm (this may take a while) -> Accept License -> Select box to trust signers -> Trust Selected

2.9 Restart Eclipse when prompted (or manually)

When opening Eclipse again, wait for Google Cloud SDK to download and configure (this may take a while)

3.0 Add GCP Library to build path

Right click Homii folder in Project Explorer -> Build Path -> Configure Build Path -> Libraries -> Add Library -> Google Cloud Platform Libraries -> Next -> Select "Cloud Storage" -> Finish -> Apply and Close

## Usage instruction


The functions we have now can be summarized in four main features: 

- Create account & account management 

- My rental  management

- Create complain case & case tracing

- Read pbulic cases

- Rating system

And two additional features:

- Apartment management function (for landlord)

- Payment function


**1. Create account & account management**

**1.1 Sign-up**

  - Click Login button on the up-right corner.

  - Fill up your personal information
  
   ![image](https://user-images.githubusercontent.com/91846668/140576288-89205fa1-0aec-4255-ade6-50d65e88313a.png)

**Error proof function**

- It would show an error message if the data formation is not as expected. (as the red message shown below the texting box)

 ![image](https://user-images.githubusercontent.com/91846668/140576317-9a7abac3-5cc3-4c67-b75e-20dda3e36ea9.png)

**Account activation**

- It is needed to activate your account via auto confirmation mail after sign up.

 ![image](https://user-images.githubusercontent.com/91846668/140576340-92de1ca6-ccf4-4d06-9e36-ad68b8d18754.png)

**1.2 Log in**

- Key in account number & password in “LOG IN” tab.

- Note the account only can be used after activated via confirmation mail.

**1.3 Forget password**

- Click “forget password” (as marked on the image below) and you’ll receive a random password via your email.

 ![image](https://user-images.githubusercontent.com/91846668/140576391-42a27ea4-f59b-4a7e-9696-96eb88ea7cdd.png)

 
**1.4 Change password**

- Change your password in “Member center” tab.

**1.5 Edit personal information**

- Modify personal information in “Member center” tab.

![image](https://user-images.githubusercontent.com/91846668/140576430-7821cf5a-ad3a-4e49-bf0f-39d0bddbafaa.png)

**2. My rental management**

**2.1 set up retal information**

- Click “My Rent” to view the rental status.

- Click “Register new rent” to set your rental information.

![image](https://user-images.githubusercontent.com/91846668/140576468-a8e2bc37-076d-4ef9-a829-69b828fdc22b.png)

![image](https://user-images.githubusercontent.com/91846668/140576491-d8d06e1f-c5cf-499b-bad3-675b0b4d40f9.png)

**3. Create complain case & case tracing**

**3.1 Create a complain case**

- Click the create case on the up-right corner.

- Fill up the information (description, priority, photo, video, etc).

 ![image](https://user-images.githubusercontent.com/91846668/140576523-edfac365-8155-4fc5-abd0-f2bec32274ae.png)
 
**3.2 Trace opened cases**

- Go to “My rent” tab to check all the cases you have issued.

 ![image](https://user-images.githubusercontent.com/91846668/140576544-0eac5b88-478f-4f27-9d7e-4b97dd89c367.png)
 
**4. Read public cases**

If users create their complaint cases with pulic, everyone can read their cases on the index page.

**4.1 Public cases are shown on the index page**

The public cases are shown with three sorting:

1. Top rated first

![image](https://user-images.githubusercontent.com/91846668/142710714-4821bfd5-5387-4db3-a7a0-f9fd6aa08d02.png)

2. Worst rated first

![image](https://user-images.githubusercontent.com/91846668/142710727-cbe24a4b-4ff2-43fd-8a86-d61ac4213fa5.png)

3. Latest posted first

![image](https://user-images.githubusercontent.com/91846668/142710736-65b801b0-c05f-4013-8cb2-578e45e42992.png)

**4.2 Read the public cases**

Users can interact with the case tiles in two way:

1. Click on "Read More" to read the details of the case.

![image](https://user-images.githubusercontent.com/91846668/142710812-bf0b5808-100c-4bd7-9af1-d7c95609dfb6.png)

2. Click on the apartment name to access the apartment property page.

![image](https://user-images.githubusercontent.com/91846668/142710842-f492e3ab-28b0-4562-9447-31d0b4b576d9.png)

*Since "My property" page will be implemented in the next iteration, the content of apartment will be updated then.

**5. Rating system**

*Please note it's needed to update MySLQ script first: http://tiny.cc/6mpluz)

(Since "My property" is not constructed, the rating function is just for demo)

**5.1 Run the rating page (addRate.jsp) in the project folder**

(It will be linked through "My property" page in next iteration)

![image](https://user-images.githubusercontent.com/91846668/142686631-2e17b7ae-e951-41cb-9618-0592d1d53d70.png)

**5.2 Enter the ratings and comments**

![image](https://user-images.githubusercontent.com/91846668/142686857-81703590-182f-46ca-98d1-24913414af13.png)


**[Additional features]**

**6. Apartment management function (for landlord)**

**6.1 Sign up as landlord**

- Select “landlord” when signing up (as below).

- There would be “My property” tab only for landlords managing their properties.

 ![image](https://user-images.githubusercontent.com/91846668/140576579-08a56ad8-7858-4c09-a21d-a622959e66f5.png)
 
**6.2 Add apartment**

- Go to “My Property” tab.

- Click the “Add an Apartment” on top-right corner.

- Fill up the information of apartment to add new apartment.

 ![image](https://user-images.githubusercontent.com/91846668/140576597-091f7bae-4941-419b-9d45-18bb92adb954.png)
 	
**6.3 Response complain cases**

- Go to “My Property” tab.

- There are all complaint cases related with your apartments listed.

 ![image](https://user-images.githubusercontent.com/91846668/140576611-6cdc4001-23d6-495b-9dbf-415b2e99b5e3.png)

 ![image](https://user-images.githubusercontent.com/91846668/140576625-9004e379-a7f0-45f5-8129-7c8c029ae4cb.png)

 
**7. Payment function**

**7.1 Add credit card**

- Go to “Member Center” tab

- Select “Payment” sub-tab

- Add new credit card information

  ![image](https://user-images.githubusercontent.com/91846668/140576644-7513423f-be9d-41b7-af37-d37073446f0c.png)
 
**7.2 View balance**

- Go to “My rent” tab

- The balance is shown in that tab

  ![image](https://user-images.githubusercontent.com/91846668/140576661-e024f1c8-d50b-41e9-bcb7-ddf6bc6bacb9.png)
 
**7.3 Pay rental fee**

- Go to “My rent” tab

- Click “Make a payment” to go to payment page

- Input the amount & select the credit card (the box on the top-right of the image below) to finish the payment

  ![image](https://user-images.githubusercontent.com/91846668/140576684-7b27649f-1a33-4e90-a8e7-0c40c45a2f9f.png)

	 
**7.4 Add fee (for landlord)**

- Go to “Payment System” tab

- Select the tenant want to charge

- Enter amount
 
 ![image](https://user-images.githubusercontent.com/91846668/140576736-f4affe72-1fb9-46d7-bc92-ddc9dbf451a9.png)





## Testing instruction

- As long as you have installed the latest FireFox, Google Chrome, and Safari browser on your PC/laptop, you would be successfully running the Selenium tests. Otherwise, it would cause some errors once you have not installed one of those browsers that we mentioned above. 

- Google Chrome Download Link
	- Windows: https://www.google.com/intl/en_us/chrome/
	- MacOS: https://www.google.com/chrome/browser/desktop/index.html

- FireFox Download Link:
	- https://www.mozilla.org/firefox/download/thanks/

- Safari Download Link:
	- Windows OS: https://support.apple.com/downloads/safari
	- MacOS: No need to Download again. 


**Note**
- In order to open this project in Safari browser, pleas make sure you turn-on the develop mode in your Safari browser. Otherwise, you won't be able to open our prject by using Safari. 

- How to "Turn On Develope Mode"
	- Open Safari Browser
	- Open Preference
	- Click "Advanced"
	- Check the "Show Develop on the Menu Bar"
	- Click Develop, and Check "Allow Remote Automation"






