class RegistrationsController < Devise::RegistrationsController

    private

        def sign_up_params
            params.require(:funcionario).permit(:codigo, :nome, :data_nascimento, :rg, :sexo, :data_admissao, :ctps, :cnh, :cns, :status, :telefone, :cpf, :setor_id, :email, :password, :password_confirmation)
        end

        def account_update_params
            params.require(:funcionario).permit(:codigo, :nome, :data_nascimento, :rg, :sexo, :data_admissao, :ctps, :cnh, :cns, :status, :telefone, :cpf, :setor_id, :email, :password, :password_confirmation)
        end

        def set_setors_for_select
            @setor_options = Setor.all
        end
    
end