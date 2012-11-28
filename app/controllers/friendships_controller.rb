class FriendshipsController < ApplicationController
	def create
		@friendship = current_user.friendships.build(friend_id: params[:friend_id])

		if @friendship.save
			redirect_to current_user, notice: 'Amigo adicionado com sucesso'
		else
			redirect_to current_user, alert: 'Nao foi possivel adicionar.'
		end
	end

	def destroy
		@friendship = current_user.friendships.find(params[:id])
		@friendship.destroy
		redirect_to current_user, alert: 'Amigo removido com sucesso'
	end
end
