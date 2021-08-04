# App Folder

Structuring this folder so that we keep pure classes and functions of business layers stuff in domain; while keeping those classes and functions dirtied with UI in the UI layer.

This is known as a service layered onion architecture and is also categorized by sometimes having modules.

Note: Dart files in the root of the lib folder and app subfolder are always considered part of the UI layer as they directly couple to the framework.

Also note in all DIs frameworks we usually place the service-locator-module DI initiator in the root of lib folder location.