class FriendshipsController < ApplicationController
	def create
		@friendship = current_user.friendships.build(friend_id: params[:friend][:friend_id])

		if @friendship.save
			redirect_to user_path(current_user.username), notice: 'Amigo adicionado com sucesso'
		else
			redirect_to user_path(current_user.username), alert: 'Nao foi possivel adicionar.'
		end
	end

	def destroy
		@friendship = current_user.friendships.find(params[:id])
		@friendship.destroy
		redirect_to user_path(current_user.username), alert: 'Amigo removido com sucesso'
	end
end
