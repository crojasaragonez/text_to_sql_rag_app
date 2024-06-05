DROP TABLE IF EXISTS Campo;
DROP TABLE IF EXISTS Cultivo;
DROP TABLE IF EXISTS Cosecha;
DROP TABLE IF EXISTS Camion;
DROP TABLE IF EXISTS Conductor;
DROP TABLE IF EXISTS Transporte;
DROP TABLE IF EXISTS Ingenio;
DROP TABLE IF EXISTS Proceso;
DROP TABLE IF EXISTS Producto;

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
    FechaCosecha DATE,
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

CREATE TABLE Ingenio (
    IngenioID INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Ubicacion VARCHAR(255)
);

CREATE TABLE Proceso (
    ProcesoID INT PRIMARY KEY,
    IngenioID INT,
    FechaInicio DATE,
    FechaFin DATE,
    TipoProceso VARCHAR(100),
    FOREIGN KEY (IngenioID) REFERENCES Ingenio(IngenioID)
);

CREATE TABLE Producto (
    ProductoID INT PRIMARY KEY,
    ProcesoID INT,
    NombreProducto VARCHAR(255),
    CantidadProducida DECIMAL(10, 2),
    UnidadMedida VARCHAR(50),
    FOREIGN KEY (ProcesoID) REFERENCES Proceso(ProcesoID)
);

INSERT INTO Campo (CampoID, Nombre, Ubicacion, Area) VALUES
(1, 'Campo Norte', 'Región Norte', 150.5),
(2, 'Campo Sur', 'Región Sur', 200.0);

INSERT INTO Cultivo (CultivoID, CampoID, FechaSiembra, FechaCosecha) VALUES
(1, 1, '2023-01-15', '2023-12-15'),
(2, 2, '2023-02-01', '2023-11-30');

INSERT INTO Cosecha (CosechaID, CultivoID, FechaCosecha, CantidadToneladas) VALUES
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

INSERT INTO Ingenio (IngenioID, Nombre, Ubicacion) VALUES
(1, 'Ingenio Central', 'Ciudad Central');

INSERT INTO Proceso (ProcesoID, IngenioID, FechaInicio, FechaFin, TipoProceso) VALUES
(1, 1, '2023-01-01', '2023-12-31', 'Molienda'),
(2, 1, '2023-01-01', '2023-12-31', 'Generación de energía'),
(3, 1, '2023-12-18', '2023-12-20', 'Bio-Destilado'),
(4, 1, '2023-12-21', '2023-12-23', 'Compostaje');

INSERT INTO Producto (ProductoID, ProcesoID, NombreProducto, CantidadProducida, UnidadMedida) VALUES
(1, 1, 'Azúcar moscabado', 300, 'Toneladas'),
(2, 1, 'Azúcar blanco corriente', 1038, 'Toneladas'),
(3, 1, 'Azúcar blanco especial', 525, 'Toneladas'),
(4, 1, 'Azúcar refinado', 100.0, 'Toneladas'),
(5, 1, 'Azúcar micro pulverizado', 50.0, 'Toneladas'),
(6, 2, 'ENERGÍA', 203520, 'MW/h'),
(7, 3, 'ALCOHOL CARBURANTE', 30000, 'Litros'),
(8, 4, 'KOMPOSTAR', 80000, 'Kilos'),
(9, 4, 'NUTRI-HUMIC', 40000, 'Kilos');
