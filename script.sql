DROP TABLE IF EXISTS Campo;
DROP TABLE IF EXISTS Cultivo;
DROP TABLE IF EXISTS Cosecha;
DROP TABLE IF EXISTS Camion;
DROP TABLE IF EXISTS Conductor;
DROP TABLE IF EXISTS Transporte;
DROP TABLE IF EXISTS Proceso;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Produccion;

CREATE TABLE Campo (
    CampoID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Ubicacion VARCHAR(255),
    Area DECIMAL(10, 2)
);

CREATE TABLE Cultivo (
    CultivoID INT PRIMARY KEY,
    CampoID INT,
    FechaSiembra DATE,
    FechaCosecha DATE,
    FOREIGN KEY (CampoID) REFERENCES Campo(CampoID)
);

CREATE TABLE Cosecha (
    CosechaID INT PRIMARY KEY,
    CultivoID INT,
    Fecha DATE,
    CantidadToneladas DECIMAL(10, 2),
    FOREIGN KEY (CultivoID) REFERENCES Cultivo(CultivoID)
);

CREATE TABLE Camion (
    CamionID INT PRIMARY KEY,
    Placa VARCHAR(50),
    Modelo VARCHAR(100),
    Capacidad DECIMAL(10, 2)
);

CREATE TABLE Conductor (
    ConductorID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Licencia VARCHAR(100)
);


CREATE TABLE Transporte (
    TransporteID INT PRIMARY KEY,
    CosechaID INT,
    FechaTransporte DATE,
    CamionID INT,
    ConductorID INT,
    FOREIGN KEY (CosechaID) REFERENCES Cosecha(CosechaID),
    FOREIGN KEY (CamionID) REFERENCES Camion(CamionID),
    FOREIGN KEY (ConductorID) REFERENCES Conductor(ConductorID)
);

CREATE TABLE Producto (
    ProductoID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    UnidadMedida VARCHAR(50)
);

CREATE TABLE Proceso (
    ProcesoID INT PRIMARY KEY,
    Nombre VARCHAR(255)
);

CREATE TABLE Produccion (
    ProduccionID INT PRIMARY KEY,
    ProductoID INT,
    ProcesoID INT,
    FechaInicio DATE,
    FechaFin DATE,
    Cantidad DECIMAL(10, 2),
    FOREIGN KEY (ProcesoID) REFERENCES Proceso(ProcesoID)
    FOREIGN KEY (ProductoID) REFERENCES Producto(ProductoID)
);

INSERT INTO Campo (CampoID, Nombre, Ubicacion, Area) VALUES
(1, 'Campo Norte', 'Región Norte', 150.5),
(2, 'Campo Sur', 'Región Sur', 200.0);

INSERT INTO Cultivo (CultivoID, CampoID, FechaSiembra, FechaCosecha) VALUES
(1, 1, '2023-01-15', '2023-12-15'),
(2, 2, '2023-02-01', '2023-11-30');

INSERT INTO Cosecha (CosechaID, CultivoID, Fecha, CantidadToneladas) VALUES
(1, 1, '2023-12-16', 120.5),
(2, 2, '2023-12-01', 180.0);

INSERT INTO Camion (CamionID, Placa, Modelo, Capacidad) VALUES
(1, 'ABC123', 'Modelo X', 15.0),
(2, 'DEF456', 'Modelo Y', 20.0);

INSERT INTO Conductor (ConductorID, Nombre, Licencia) VALUES
(1, 'Juan Pérez', 'LIC123'),
(2, 'Luis Gómez', 'LIC456'),
(3, 'María López', 'XYZ987654'),
(4, 'Carlos Gómez', 'JKL654321'),
(5, 'Ana Martínez', 'MNO432198'),
(6, 'Luis Fernández', 'PQR567890'),
(7, 'Laura González', 'STU123789'),
(8, 'José Ramírez', 'VWX789654'),
(9, 'Marta Sánchez', 'BCD987321'),
(10, 'Pedro Torres', 'EFG123987'),
(11, 'Sofía Díaz', 'HIJ456321'),
(12, 'Miguel Herrera', 'KLM654123'),
(13, 'Paula Castro', 'NOP432765'),
(14, 'Roberto Ruiz', 'QRS567123'),
(15, 'Julia Morales', 'TUV789321'),
(16, 'Alejandro Navarro', 'WXY123654'),
(17, 'Isabel Rivas', 'ZAB987456'),
(18, 'Diego Vega', 'CDE432198'),
(19, 'Valentina Ortiz', 'FGH654789');

INSERT INTO Transporte (TransporteID, CosechaID, FechaTransporte, CamionID, ConductorID) VALUES
(1, 1, '2023-12-17', 1, 1),
(2, 2, '2023-12-02', 2, 2);

INSERT INTO Proceso (ProcesoID, Nombre) VALUES
(1, 'Preparación de caña'),
(2, 'Molienda'),
(3, 'Generación de vapor y electricidad'),
(4, 'Calentamiento'),
(5, 'Clarificación'),
(6, 'Filtración'),
(7, 'Evaporación'),
(8, 'Cristalización y Centrifugación'),
(9, 'Secado'),
(10, 'Bio-Destilado'),
(11, 'Compostaje');

INSERT INTO Producto (ProductoID, Nombre, UnidadMedida) VALUES
(1, 'Azúcar blanco corriente', 'Toneladas'),
(2, 'Azúcar moscabado', 'Toneladas'),
(3, 'Azúcar blanco especial', 'Toneladas'),
(4, 'Azúcar refinado', 'Toneladas'),
(5, 'Azúcar micro pulverizado', 'Toneladas'),
(6, 'Energía', 'MW/h'),
(7, 'Alcohol Carburante', 'Litros'),
(8, 'Kompostar', 'Sacos 40 kg'),
(9, 'Nutri-Humic', 'Sacos 40 kg');

INSERT INTO Produccion (ProduccionID, ProductoID, ProcesoID, FechaInicio, FechaFin, Cantidad) VALUES
(1, 1, 2, '2023-01-01', '2023-12-31', 753220.41),
(2, 2, 2, '2023-01-01', '2023-12-31', 5089.33),
(3, 3, 2, '2023-01-01', '2023-12-31', 238883.22),
(4, 4, 2, '2023-01-01', '2023-12-31', 118817.60),
(5, 5, 2, '2023-01-01', '2023-12-31', 55256.60),
(6, 6, 3, '2023-01-01', '2023-12-31', 203520),
(7, 7, 10, '2023-01-01', '2023-12-31', 30000),
(8, 8, 11, '2023-01-01', '2023-12-31', 8521),
(9, 9, 12, '2023-01-01', '2023-12-31', 4385);
