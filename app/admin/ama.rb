ActiveAdmin.register Ama do

  actions :all, :except => [:destroy]

  action_item :only => :show do
    link_to 'Public', ama
  end

  action_item :only => :show do
    link_to 'Trash', trash_admin_ama_path, method: :delete
  end

  member_action :trash, :method => :delete do
    ama = Ama.find_by_key(params[:id])
    ama.trash()
    redirect_to admin_amas_path
  end

  member_action :add_user, :method => :get do
    ama = Ama.find_by_key(params[:id])
    user = User.find_or_create_by(username: params[:username])
    if user
      ama.users << user
    end
    redirect_to admin_ama_path(ama)
  end

  form :partial => "tags"

  controller do
    defaults :finder => :find_by_key

    def permitted_params
      params.permit(:ama => [:tag_list])
    end
  end

  show do |ama|
    attributes_table do

      row :date
      row :title
      row :content do
        ama.content.html_safe
      end
      row :tag_list
      row :op do
        link_to ama.user.username, new_moderate_op_path(user_id: ama.user.id)
      end
      row :participants do
        ama.users.map{|u| link_to u.username, new_moderate_op_path(user_id: u.id)}.join(", ").html_safe
      end
      row :karma
      row :permalink
      row :created_at
      row :updated_at
      row :comments
      row :responses
      row :id
      row :key
    end
    active_admin_comments
  end

  scope :queue, default: true
  scope :tagless
  scope :opless
  scope :all

  filter :title

  index do
    column :karma
    column :title
    column :created_at
    column :updated_at
    default_actions
  end



end