CREATE TABLE [dbo].[gameScreens](
	[game_id] [integer] NOT NULL, 
    [screenNum] [integer] NOT NULL,
    [images_id] [varchar](100) NOT NULL,
    [target] [varchar](100) NOT NULL, 
    [score] [integer],
    PRIMARY KEY (game_id,screenNum))