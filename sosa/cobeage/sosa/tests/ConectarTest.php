<?php

use PHPUnit\Framework\TestCase;

class ConectarTest extends TestCase
{
    public function testConexionExitosa()
    {
        // Simular la configuración del archivo config.ini
        $config = [
            'database' => [
                'url' => '161.132.38.229',
                'username' => 'root',
                'password' => 'Upt2024',
                'dbname' => 'DBSOSA'
            ]
        ];

        // Guardar la configuración en un archivo temporal (simulación)
        $tempConfigFile = tempnam(sys_get_temp_dir(), 'config');
        file_put_contents($tempConfigFile, serialize($config));

        // Incluir el archivo db.php y capturar la salida
        ob_start();
        include 'C:/calidad/sosa/cobeage/sosa/DB/db.php';
        $output = ob_get_clean();

        // Verificar que la conexión se establezca correctamente
        $this->assertTrue(class_exists('Conectar'));
        $conexion = Conectar::conexion();

        // Verificar que se retorna un objeto de conexión válido
        $this->assertInstanceOf('mysqli', $conexion);
    }

    public function testManejoErroresConexion()
    {
        // Simular una configuración inválida (ejemplo: archivo config.ini no encontrado)
        $config = false;

        // Guardar la configuración en un archivo temporal (simulación)
        $tempConfigFile = tempnam(sys_get_temp_dir(), 'config');
        file_put_contents($tempConfigFile, serialize($config));

        // Capturar la salida de la inclusión de db.php
        ob_start();
        include 'C:/calidad/sosa/cobeage/sosa/DB/db.php';
        $output = ob_get_clean();

        // Probar la función de conexión y esperar una excepción
        try {
            Conectar::conexion();
            $this->fail('Se esperaba una excepción de conexión fallida.');
        } catch (\Exception $e) {
            // Verificar el mensaje de error
            $this->assertStringContainsString('Connection failed', $e->getMessage());
        }
    }
}
