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

If settings kept as default, rails server will run on http://localhost:3000 and hence append that with the paths in the table below.

| Action                                                                   | HTTP Verb | Path                                                                        | Parameters  | Body                                                                       | Response                                                |
|--------------------------------------------------------------------------|-----------|-----------------------------------------------------------------------------|---------------------------------------------|--------------------------------------|---------------------------------------------------------|
| Get a token for a new application                                        | POST      | /applications/create/?name=:name                                            | :name       |  |                                                                      | :token                             |
| Get List for all applications                                | GET       | /applications/list                                        |                                                 |                       | {:app_name, :chats_count, :created_at}                                          |
| Get an application                                               |GET            | /applications/:token/show | :token                    |   |  {:app_name, :chats_count, :created_at}
| update application name    | Update     |    /applications/:token/update/  |  :token  |  {:name} |{:app_name, :chats_count, :created_at} |
