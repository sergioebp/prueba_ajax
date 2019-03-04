ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end
    
    columns do
      column do
        panel "Número de Empresas" do
          ul do
              li Company.all.count
          end
        end
      end

      column do
        panel "Número de Usuarios" do
          ul do
              li User.all.count
          end
        end
      end

      column do
        panel "Número de Reclamos" do
          ul do
              li Claim.all.count
          end
        end
      end
    end
  end # content
end
