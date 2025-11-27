
/*
-- Criação da tabela department
CREATE TABLE department (
  Id INT NOT NULL IDENTITY(1,1),
  Name VARCHAR(60) NULL,
  PRIMARY KEY (Id)
);

-- Criação da tabela seller
CREATE TABLE seller (
  Id INT NOT NULL IDENTITY(1,1),
  Name VARCHAR(60) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  BirthDate DATETIME NOT NULL,
  BaseSalary FLOAT NOT NULL,
  DepartmentId INT NOT NULL,
  PRIMARY KEY (Id),
  FOREIGN KEY (DepartmentId) REFERENCES department(Id)
);

-- Inserção de dados na tabela department
INSERT INTO department (Name) VALUES 
  ('Computers'),
  ('Electronics'),
  ('Fashion'),
  ('Books');

-- Inserção de dados na tabela seller
-- Formato de data corrigido para evitar erro de conversão
INSERT INTO seller (Name, Email, BirthDate, BaseSalary, DepartmentId) VALUES 
  ('Bob Brown','bob@gmail.com','1998-04-21T00:00:00',1000,1),
  ('Maria Green','maria@gmail.com','1979-12-31T00:00:00',3500,2),
  ('Alex Grey','alex@gmail.com','1988-01-15T00:00:00',2200,1),
  ('Martha Red','martha@gmail.com','1993-11-30T00:00:00',3000,4),
  ('Donald Blue','donald@gmail.com','2000-01-09T00:00:00',4000,3),
  ('Alex Pink','bob@gmail.com','1997-03-04T00:00:00',3000,2);*/

  -- use especifica o banco de dados que deseja ser usado assim podendo fazer uso de mais de um banco de dados em uma unica consulta obs não recomentado chamar mais de um banco de dados em uma consulta
  use Teste
  select * from department



  use ContosoRetailDW
  select * from DimCustomer
