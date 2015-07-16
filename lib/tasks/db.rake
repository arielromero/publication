namespace :db do  
  desc "Syncs local database with production"

  db_config = Rails.configuration.database_configuration
  develop_db = db_config['development']['database']
  production_db = db_config['production']['database']
  #app_name = 'publication'
  app_name = 'publicacionesprueba'

  task :push do
    # Se hace backup en Heroku y se sube la base local.
    # Si hay problemas se corta todo...
    begin
      puts 'Realizando backup en Heroku...'
      puts system("heroku pg:backups capture --app #{app_name}")
      puts 'Borrando la BBDD en Heroku :o'
      puts system("heroku pg:reset DATABASE_URL --confirm #{app_name}")
      #puts `heroku run rake db:migrate VERSION=0`
      puts 'Reemplazando la BBDD de producción con la local'
      puts system("heroku pg:push #{develop_db} DATABASE_URL --confirm #{app_name}")
      #puts system("heroku pg:transfer --from #{develop_db} --to DATABASE_URL --confirm #{app_name}")
    rescue
      puts 'Ha ocurrido un error... :('
    end
  end

  task :pull do
    puts 'Realizando backup de BBDD local...'

    # Hacer backup local
    begin
      dump_name = "dump_#{Time.now.to_i}.dump"
      system("pg_dump #{develop_db} > #{dump_name}")
      puts '¡Backup realizado exitosamente!'
      puts ''
      puts 'Se guardo el siguiente archivo: ' + dump_name
    rescue
      puts 'Error al realizar backup :('
    end
    
    # Bajar BBDD de producción y levantar en la local
    begin
      puts ''
      puts 'Reemplazando la BBDD local con la de producción...'
      puts system("dropdb #{develop_db}")
      puts system("heroku pg:pull DATABASE_URL #{develop_db} --app #{app_name}")
    rescue
      puts 'Ocurrió un error al restaurar la BBDD desde Heroku.'
    end
  end

  task :restore do
    puts 'Restaurando DDBB de producción con último backup (de Heroku)'

    begin
      puts system("heroku pg:backups restore --confirm #{app_name}")
    rescue
      puts 'Ocurrió un error :('
    end
  end
end