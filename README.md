# THE DAILY WORD | README
<p>The Daily Word is an inspirational iOS application that provides a stream of inspirational quotes that can be saved to your profile for a message when you need it most.</p> 
<br>
<a href="https://www.youtube.com/watch?v=0K6X736zKcw">Link to YouTube Walkthrough Video</a>
<br>

## Installation
<hr/>
<p>This application has not (yet) been submitted to the App Store, but don't worry. You can run the code on a virtual device.</p>
<br>

### <span style="color:green">Install XCode</span>

 <p>Install <a href= "https://developer.apple.com/xcode/resources/">XCode</a>, the Apple IDE, to access the iPhone virtual devices as well as to get all of the files and permissions you need to run the app and eventually submit to the App Store.</p> 

 ### <span style="color:green">Install Flutter</span>
 <p>In <a href="https://code.visualstudio.com/download">Visual Studio Code</a> install the <a href="https://flutter.dev/">Flutter</a> package. This will allow you to use the framework to code the application.</p>

 ### <span style="color:green">Running Code on Virtual Device</span>
<p>Now that you've installed Flutter, you can start a virtual device and open up the project in VS Code, navigate to the root folder and execute:</p>

```
flutter run
```
<p>The app will open on your virtual device in debug mode.</p>

## Usage
<hr/>

### <span style="color:green">Register</span>
<p>When the app opens you're greeted by a sign in screen (if you're not already logged in). Once on the sign in screen, tap the Register Now link below the password text box. Just enter a username, email, password and password confirmation and you're all set. You'll be taken to the heart of the app - the quote feed. </p>

### <span style="color:green">Log Out</span>
<p>While on the quote feed home screen, tap the log out button in the upper right hand corner. You'll be redirected back to the sign in page.</p>

### <span style="color:green">Log In</span>
<p>You can sign in by entering your email and password. This will take you back to the home screen.</p>

### <span style="color:green">View Daily Words</span>
<p>The home screen contains an API feed from Zenquotes.io. From here you can read a quote and for the ability to save / share the quote you can click on the list tile to be taken to a detail page.</p>

### <span style="color:green">Save Daily Word</span>
<p>If you find a message that you love, you can click the heart just below the quote and the author on the detail page. This will store the quote in your favorites so that you can reference it later.</p>

### <span style="color:green">Share to Reminders & SMS</span>
<p>If you REALLY love the quote, you may want to share it with friends via SMS or save it to your reminders to give you a notification at a certain time during a tough day, or maybe just copy it and use it in another document. Simply press the share button for a menu of options to appear. Sharing is caring.</p>

### <span style="color:green">View Favorites</span>
<p>Remember all those quotes you loved? Well we saved them for you on the favorites tab. Click the heart icon in the bottom navigation bar and you'll be directed to the quotes you've saved to bring you joy on a tough day.</p>



### <span style="color:green">View Profile</span>
<p>The profile page is a welcome message along with a count of how many favorites you've saved and can be accessed by pressing the third icon on the tab bar.</p>

## Coming Soon
<hr/>

### <span style="color:green">Edit Profile</span>
<p>Currently the settings page doesn't allow for editing the profile at all. It's a static read of what is stored in the firebase backend. I would update this to include editable fields that are prepopulated with existing data about the user.</p>

### <span style="color:green">Delete Favorite</span>
<p>At present you cannot delete any favorites. I would add this feature on the favorites tab.</p>