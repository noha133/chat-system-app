# Ruby on Rails API App with Dokcer using Redis, Sidekiq, Mysql and Elastic Search

## This application serves as a chat API designed to facilitate communication between different applications

# Requirments
- Docker
- Docker Compose

## Installation

To set up the application, follow these steps:

1. Clone the repository:
   git clone <repository_url>
2. Navigate to the project directory:
   cd <project_directory>
3. Run the following command :
   docker-compose --build

## API Description


| Action                                                                   | HTTP Verb | Path                                                                        | Parameters  | Body                                                                       | Response                                                |
|--------------------------------------------------------------------------|-----------|-----------------------------------------------------------------------------|---------------------------------------------|--------------------------------------|---------------------------------------------------------|
| Get a token for a new application                                        | POST      | /applications?name=:name                                            | :name       |  |                                                                      | :token                             |
| Get List for all applications                                | GET       | /applications                                        |                                                 |                       | {:app_name, :chats_count, :created_at}                                          |
| Get an application                                               |GET            | /applications/:token | :token                    |   |  {:app_name, :chats_count, :created_at}
| update application name    | UPDATE     |    /applications/:token  |  :token  |  {:name} |{:app_name, :chats_count, :created_at} |
| Create a new chat    | POST   | /applications/:token/chats | :token |  | {:chat_number} |   
Get all chat for an application | GET | /applications/:token/chats | :token | | :chat_number :messages_count |
Create a new message for a chat | POST | '/applications/:token/chats/:chat_number/messages | :token :chat_numbe | |  {"message_number"}
| Get all messages for a chat | GET | /applications/:token/chats/:chat_number/messages | :token :chat_number |  | {"message_number", "text"} |


