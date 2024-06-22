int rowsAffected = ps.executeUpdate();
            System.out.println("anda dentro del try de ubi");
            if (rowsAffected > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    System.out.println("si hay auto incre para ubi: "+ generatedKeys.getInt(1));
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("No se generó un ID para la ubicacion.");
                }
            } else {
                throw new SQLException("No se pudo insertar la ubicacion.");
            }