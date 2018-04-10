CREATE TABLE Localidade (
  CodigoLocalidade INTEGER  NOT NULL   IDENTITY ,
  LongitudadeLocalidade CHAR(500)    ,
  LatitudeLocalidade CHAR(500)      ,
PRIMARY KEY(CodigoLocalidade));
GO




CREATE TABLE Usuario (
  CodigoUsuario INTEGER  NOT NULL   IDENTITY ,
  NomeUsuario CHAR(100)    ,
  TelefoneUsuario CHAR(15)    ,
  EmailUsuario CHAR(100)      ,
PRIMARY KEY(CodigoUsuario));
GO




CREATE TABLE Carona (
  CodigoCarona INTEGER  NOT NULL   IDENTITY ,
  DestinoCarona INTEGER  NOT NULL  ,
  DataCarona DATETIME    ,
  StatusCarona CHAR(1)      ,
PRIMARY KEY(CodigoCarona)  ,
  FOREIGN KEY(DestinoCarona)
    REFERENCES Localidade(CodigoLocalidade));
GO


CREATE INDEX Carona_FKIndex1 ON Carona (DestinoCarona);
GO


CREATE INDEX IFK_Destino ON Carona (DestinoCarona);
GO


CREATE TABLE EventoCarona (
  CodigoCaronaEvento INTEGER  NOT NULL  ,
  EventoCodigoUsuario INTEGER  NOT NULL  ,
  LocalizacaoUsuario INTEGER    ,
  MotoristaCarona BOOL    ,
  StatusUsuarioCarona CHAR(1)      ,
PRIMARY KEY(CodigoCaronaEvento, EventoCodigoUsuario)      ,
  FOREIGN KEY(CodigoCaronaEvento)
    REFERENCES Carona(CodigoCarona),
  FOREIGN KEY(EventoCodigoUsuario)
    REFERENCES Usuario(CodigoUsuario),
  FOREIGN KEY(LocalizacaoUsuario)
    REFERENCES Localidade(CodigoLocalidade));
GO


CREATE INDEX Carona_has_Usuario_FKIndex1 ON EventoCarona (CodigoCaronaEvento);
GO
CREATE INDEX Carona_has_Usuario_FKIndex2 ON EventoCarona (EventoCodigoUsuario);
GO
CREATE INDEX EventoCarona_FKIndex3 ON EventoCarona (LocalizacaoUsuario);
GO


CREATE INDEX IFK_EventoCarona ON EventoCarona (CodigoCaronaEvento);
GO
CREATE INDEX IFK_UsuarioCarona ON EventoCarona (EventoCodigoUsuario);
GO
CREATE INDEX IFK_LocalizacaoUsuario ON EventoCarona (LocalizacaoUsuario);
GO



