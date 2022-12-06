# THE DAILY WORD | DESIGN
<p>This project was incredibly fun to design and also winds up being a useful application to bring a bit of joy on what could be tough days. I had a great time learning dart and flutter, which are simlilar to HTML and CSS in the structure of the page. Also, it was a lot of fun learning firebase to see the data being stored on a backend. Given all of what we learned about programming databases, I have a great deal of respect and appreciation for the Firebase team at Google for making it a great user-friendly backend option.</p> 
<br>

## Idea & Implementation
<hr/>
<p>The idea was to create a simple, yet useful mobile application that would allow users to get inspirational quotes every time they opened the app and to be able to save some of those quotes for future reading.  To do this, I knew I needed at least 3 views, a stream view that held the quote streams. A detail view for users to save and share. and a favorites view so that users could view all of their saved quotes.</p>

<p>I could have done this in many different languages, but I chose Dart and Flutter for its similarity to HTML and speed and responsiveness. I also wanted to make this cross-platform evenutally and to only have to maintain one codebase, I chose Flutter. Firebase was an easy decision for a backend because of it's "quick-start" nature. With a few keystrokes, you have a fully-functioning backed that takes care of all security, authorizations, and storage for you.</p>
<br>

### <span style="color:green">Stream (Home) View</span>
 <p>I wanted the stream to feel like a twitter feed; making it feel as if the stoics themselves were speaking directly to you in real time. Dart has widgets that come out of the box like Cards and ListTiles that make the design of the stream very easy. The challenge was just getting the correct data from the api into the list so that it could populate in the stream. The <a href="https://premium.zenquotes.io/zenquotes-documentation/">ZenQuotes</a> documentation made it incredibly easy to get the quote and author into a JSON format. With a JSON reader, I was able to parse the JSON "snapshot" and save it into a list for it to be populated in the listview.</p> 

 <p>Since I knew I would be using the cards in a different view, I could have extracted it and made it a reusable widget, but since I was just using it in two places in the application, I chose to keep it in the same file.</p>

 <p>One challenge I ran into was routing. How exactly would I get users to the detail page after clicking on a quote they liked. This was very interesting, and once I learned how to do it, made a lot of sense. I simply had a file called default that handled my navigation for me. I just had to use named routes (like python) to push users to different parts of the application and could include data as arguments as well.</p>

 ### <span style="color:green">Detail View</span>
 <p>The detail view is simply 4 components (aside from the nav bar). It consists of two Text widgets for the quote and the author and two buttons (Gesture Detectors) for the save and the share functions. When a user clicks on the save button (a heart), the data is stored to the firebase firestore with the user's details attached to it. When a user shares, a menu pops up giving them an option to share via SMS, add to reminders, or copy the text. Without an active Apple Developer account, I cannot test the SMS share feature, but reminders and copy work.</p>

 ### <span style="color:green">Favorites View</span>
<p>The favorites view is where the user can view the saved quotes. This view is designed to look similar to the home feed. </p>



## Database Design
<hr/>

### <span style="color:green">User Table</span>
<p>When a user signs up, the data is saved in the authentication user table. But to tie users to data in the app, we need to create a users table. Instead of letting firebase firestore just auto-assign a value for the document ID, I chose to make the document ID the same as the UserID. thus, the path to access an individual user's data would include their UID and make it easier to access.</p>

### <span style="color:green">Favorites Table</span>
<p>This was a key design decision. I could put the favorites table on the same level as the users table, but then I would have to go into the favorites table and use a .where() to find the IDs of each document that matched the User ID. Simply creating a favorites table for each user was a better and more efficient way to get the data back from the database.</p>

