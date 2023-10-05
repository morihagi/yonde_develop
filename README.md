## 🎙 YONDE | Generate Emails for the Radio Program, All Night Nippon 📮
![Ruby](https://img.shields.io/badge/ruby-3.3.3-blue?logo=ruby&)
![Ruby on Rails](https://img.shields.io/badge/rails-7.0.6-blue?logo=rubyonrails)
![Release date](https://img.shields.io/badge/release_date-September_2023-important?)
[![Github Actions](https://github.com/morihagi/yonde_develop/actions/workflows/build.yml/badge.svg?branch=develop)](https://github.com/morihagi/yonde_develop/actions/workflows/build.yml)
[![Maintenability](https://codeclimate.com/github/morihagi/yonde_develop/badges/gpa.svg)](https://codeclimate.com/github/morihagi/yonde_develop)
[![Coverage Status](https://coveralls.io/repos/github/morihagi/yonde_develop/badge.svg)](https://coveralls.io/github/morihagi/yonde_develop)
[![x](https://img.shields.io/twitter/url/https/twitter.com/yonde1242.svg?style=social&label=Follow%20%40yonde1242)](https://twitter.com/yonde1242)


[Japanese](https://github.com/morihagi/yonde_develop/blob/develop/README_JP.md)

![OGP](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3348836/c89ed46b-414a-bd17-2523-20d90d70e882.png)
![Untitled Diagram.drawio.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/3348836/306d57af-153f-a7fb-4313-fd04444821b7.png)


By choosing a program and segment of All Night Nippon (ANN), and composing a message, you can generate an email in accordance with the program’s specific guidelines. Please note, this app is not officially affiliated with the Nippon Broadcasting System.

<br>
<br>

## 🎙 URL 📮
https://yonde.fly.dev/
<br>
<!-- After release
🎧 PV count：0PV  
🎧 User registration count：0 people  
(as of October 1, 2023) -->
<br>
<br>

## 🎙 Thoughts put into the app 📮
I've been a dedicated radio listener, including ANN, for over two decades. It's often stated that "the essence of radio lies within the listener's emails." Every program has its loyal listeners whose emails are frequently read out on the show. When a program undergoes a revamp and a new host is introduced, these fans might send their "first email submission."

For listeners who regularly contribute to programs, it would be beneficial to have a service akin to a file system where they can organize their draft submissions.For those submitting for the first time, a service that can guide them in taking the initial step toward submission would be advantageous.

It would bring me great joy if this app could increase the number of submissions to the program by even one.
<br>
<br>

## 🎙 Challenges for a Listener Submitting an Email to ANN 📮
- Each program’s story submission segment comes with specific instructions, such as “Please include this in your email.”
  - For example, the segment name announced might be “Confession Room of Degradation! No Longer Human!” on the program, but the subject line of the email must read “No Longer Human.”
- There isn’t a form similar to Google Form available, so listeners need to manually create an email and send it to the program.
- Listeners must copy and paste their name (or radio name) and subject into their email every time.
- Despite taking the time to submit, if the submission deviates from the program’s instructions, it may not be selected.

--> **These factors are expected to increase the difficulty of making submissions and getting them selected.**

### Proposed Solution
- Objective: Streamline the submission process for listers.
- Function: Develop a feature that empowers listers to compose an email in accordance with the program’s guidelines by simply completing a form.
  - Facilitate listers to choose the segment name (this selection will auto-populate the subject line as dictated by the program’s guidelines).
  - Integrate a feature that permits listers to record content that is required each time, such as radio names and prefectures.
  - Embed a feature that enables listers to record default information, which will be automatically incorporated when crafting submission content.

<br>
<br>

## 🎙 Blog 📮
In progress
<br>

<!-- Correct later  
🎧 View：0000PV  
(as of October 1, 2023) -->
<br>
<br>

## 🎙 Technologies used 📮
#### Backend
* Ruby 3.0.3
* Rails 7.0.6

#### Frontend
* HTML
* CSS (SCSS)
* Bootstrap 5.3.1 (Framework)
* JavaScript (Stimulus)

#### Database
* Postgres
#### Deployment destination
* fly.io

<!-- Correct later
## 🎙 Testing 📮
- RSpec
  - Unit test (model)
  - Function test (request)
  - Integration test (feature) -->
<br>
<br>

## 🎙 Main pages and functions 📮
In progress
<!-- Write later
- User registration, login function (devise)
- Posting function
  - Image posting (refile)
  - Location information search function (geocoder)
- Like function (Ajax)
  - Ranking function
- Comment function (Ajax)
- Follow function (Ajax)
- Pagination function (kaminari)
  - Infinite scroll (Ajax)
- Search function (ransack)
- * User identification function (LINE API, fetch)
* Schedule creation, update function (LIFF, ajax)
* Mission notification function (whenever, messaging API)
* Mission completion/incompletion function (ajax)
* LINE response function (messaging API) -->
<br>
<br>

## 🎙 Screen transition diagram 📮
[Go to Figma](https://www.figma.com/file/EJ5mZWpMUNK245rYMpHpAL/ScreenFlowDiagram?type=design&node-id=509%3A2609&mode=design&t=EszcWVn95hzmmMAA-1)
<br>
<br>

## 🎙 ER diagram 📮
```mermaid
erDiagram
    %% --------------------------------------------------------
    %% Generated by "Rails Mermaid ERD"
    %% https://github.com/koedame/rails-mermaid_erd
    %% Restore Hash: #eyJzZWxlY3RNb2RlbHMiOlsiUG9zdCIsIlByb2ZpbGUiLCJQcm9ncmFtIiwiU2VnbWVudCIsIlVzZXIiXSwiaXNQcmV2aWV3UmVsYXRpb25zIjpmYWxzZSwiaXNTaG93UmVsYXRpb25Db21tZW50IjpmYWxzZSwiaXNTaG93S2V5IjpmYWxzZSwiaXNTaG93Q29tbWVudCI6ZmFsc2UsImlzSGlkZUNvbHVtbnMiOmZhbHNlfQ==
    %% --------------------------------------------------------

    %% table name: posts
    Post {
        integer id  
        string prefecture  
        string city  
        string radio_name  
        string zip_code  
        string other_address  
        string legal_name  
        string favorite_status  
        string post_status  
        text body  
        integer user_id  
        datetime created_at  
        datetime updated_at  
        integer segment_id  
        string phone  
        string residence_prefecture  
        string residence_city  
    }

    %% table name: profiles
    Profile {
        integer id  
        string prefecture  
        string city  
        string radio_name  
        string zip_code  
        string other_address  
        string legal_name  
        integer user_id  
        datetime created_at  
        datetime updated_at  
        string phone  
        string residence_prefecture  
        string residence_city  
    }

    %% table name: programs
    Program {
        integer id  
        string program  
        string personality  
        string email  
        string image_url  
        string official_site  
        string day  
        string starting_time  
        string program_status  
        datetime created_at  
        datetime updated_at  
    }

    %% table name: segments
    Segment {
        integer id  
        string segment_title  
        string segment_status  
        string segment_title_for_email  
        text instruction  
        text official_site_instruction  
        string default_sentence  
        string novelty_goods  
        integer program_id  
        datetime created_at  
        datetime updated_at  
    }

    %% table name: users
    User {
        integer id  
        string email  
        string encrypted_password  
        string provider  
        string uid  
        string reset_password_token  
        datetime reset_password_sent_at  
        datetime remember_created_at  
        integer sign_in_count  
        datetime current_sign_in_at  
        datetime last_sign_in_at  
        string current_sign_in_ip  
        string last_sign_in_ip  
        string confirmation_token  
        datetime confirmed_at  
        datetime confirmation_sent_at  
        string unconfirmed_email  
        integer failed_attempts  
        string unlock_token  
        datetime locked_at  
        datetime created_at  
        datetime updated_at  
        datetime deleted_at  
        string oauth_token  
        datetime oauth_expires_at  
    }

    Post }o--|| User : ""
    Post }o--|| Segment : ""
    Profile |o--|| User : ""
    Program ||--o{ Segment : ""
```

<br>
<br>

🎙 Planned Future Updates 📮
- Objective: Enhance the ability of listers to craft submission emails that have a higher likelihood of acceptance.
- Functionality: Develop a feature that enables listers to refine their submission content.
  - Introduce a feature that leverages LLM model services, such as ChatGPT, to act as a consultation partner for refining submission content.
    - If the content contains violent or discriminatory language, the system will suggest alternative phrasing.
  - When creating a submission, tips for increasing the chances of acceptance are displayed, such as:
    - Favor “conversational language” over “formal written language”.
    - Ensure the submission encourages further discussion.
    - Restrict the email to a single topic.
