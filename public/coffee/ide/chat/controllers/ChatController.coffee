define [
	"base"
	"ide/chat/services/chatMessages"
], (App) ->
	App.controller "ChatController", ($scope, chatMessages, @ide, $location) ->
		$scope.chat = chatMessages.state
		
		$scope.$watchCollection "chat.messages", (messages) ->
			if messages?
				$scope.$emit "messages:updated"
				
		$scope.sendMessage = ->
			chatMessages
				.sendMessage $scope.newMessageContent
				.then () ->
					$scope.newMessageContent = ""
				
		$scope.loadMoreMessages = ->
			chatMessages.loadMoreMessages()
			
			