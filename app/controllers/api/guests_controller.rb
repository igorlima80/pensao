class Api::GuestsController < Api::ApplicationController
  # load_and_authorize_resource

  def show
    @guest = {}
    @guest = Guest.find_by(id: params[:id])
    if @guest
      render json:  @guest.to_json(
        except: [:email, :provider, :user_id, :created_at, :updated_at],
        include: [
          user: {
            except: [:id, :generated_password, :uid, :userable_id, :userable_type, :created_at, :updated_at]
          },
          address: {
            except: [:id, :addressable_type, :addressable_id, :city_id, :created_at, :updated_at],
            include: [
              city: {
                except: [:id, :state_id, :created_at, :updated_at],
                include: [
                  state: {
                    except: [:id, :ibge, :created_at, :updated_at]
                  }
                ]
              }
            ]
          }
        ])
    else
      render json: nil
    end
  end

  def create
    @guest = Guest.new(guest_params)
    
    if @guest.user
      list = Guest.joins(:user).where(users: { email: @guest.user.email })
      if list.any?
        render json: list[0].to_json(
          except: [:email, :name, :provider, :user_id, :created_at, :updated_at],
          include: [
            user: {
              except: [:id, :generated_password, :uid, :userable_id, :userable_type, :created_at, :updated_at]
            },
            address: {
              except: [:id, :addressable_type, :addressable_id, :city_id, :created_at, :updated_at],
              include: [
                city: {
                  except: [:id, :state_id, :created_at, :updated_at],
                  include: [
                    state: {
                      except: [:id, :ibge, :created_at, :updated_at]
                    }
                  ]
                }
              ]
            }
          ]
        )
      else
        if @guest.save
          @guest.send_notification("Cadastro Realizado com Sucesso", "Seja Bem Vindo!")
          render json: @guest.to_json(
            except: [:email, :name, :city_id, :provider, :user_id, :created_at, :updated_at],
            include: [user: {
              except: [:id, :generated_password, :uid, :userable_id, :userable_type, :created_at, :updated_at]
            },
            address: {
              except: [:id, :addressable_type, :addressable_id, :city_id, :created_at, :updated_at],
              include: [
                city: {
                  except: [:id, :state_id, :created_at, :updated_at],
                  include: [
                    state: {
                      except: [:id, :ibge, :created_at, :updated_at]
                    }
                  ]
                }
              ]
            }
            ]),
            status: :created
        else
          render json: @guest.errors, status: :unprocessable_entity
        end
      end
    else
      render json: @guest.errors, status: :unprocessable_entity
    end
  end
  
  def reserves
    @guest = Guest.find_by(id: params[:id])
    if @guest
      render json: @guest.reserves.order(created_at: :desc).as_json(
        methods: [:translate_status],
        except: [:total_value_currency, :created_at, :updated_at],
        include: [
                    accommodation: {
                      methods: [:common_images_urls, :fachada_images_urls, :plans],
                      except: [:id, :value_per_night, :maximum_adult, :maximum_child, :available, :value_per_night_cents,
                            :value_per_night_currency, :rating_score, :property_id, :type_trip_id, :type_accommodation_id, 
                            :created_at, :updated_at, :fake_latitude, :fake_longitude],
                      include: [
                        address: {
                          except: [:id, :city_id, :addressable_type, :addressable_id, :created_at, :updated_at]
                        } 
                      ]  
                    },
                    rating:{
                      except: [:id]
                    }
                  ]
      )
    else
      render json: nil, status: :unprocessable_entity
    end
  end

  private
    def guest_params
      params.fetch(:guest).permit(:cpf, :image,
        social_data: {},
        user_attributes: [:id, :email, :name, :provider],
        address_attributes: [
          :id, :description, :zipcode, :street, :number, :complement, :district, :city_id
        ]
      )
    end
end
