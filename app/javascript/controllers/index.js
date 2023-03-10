// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import IssueSubscriptionController from "./issue_subscription_controller"
application.register("issue-subscription", IssueSubscriptionController)

import IssuesMessagesController from "./issues_messages_controller"
application.register("issues-messages", IssuesMessagesController)

import SearchIssuesController from "./search_issues_controller"
application.register("search-issues", SearchIssuesController)
