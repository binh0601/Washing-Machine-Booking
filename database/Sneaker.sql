CREATE DATABASE [Sneaker_DB]
USE [Sneaker_DB]
GO
/****** Object:  Table [dbo].[Category]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[amound] [float] NULL,
	[accountid] [int] NULL,
	[createdAt] [datetime] NOT NULL,
	[address] [nvarchar](200) NULL,
	[note] [nvarchar](max) NULL,
	[phone] [nvarchar](12) NULL,
	[payMethod] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[productId] [int] NULL,
	[orderId] [int] NOT NULL,
	[size] [nvarchar](10) NULL,
	[color] [nvarchar](20) NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[image] [nvarchar](max) NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[description] [nvarchar](max) NULL,
	[cate_id] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_color]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_color](
	[product_id] [int] NOT NULL,
	[color] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_size]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_size](
	[product_id] [int] NOT NULL,
	[size] [nvarchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]     ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NULL,
	[user_email] [varchar](255) NOT NULL,
	[user_pass] [nvarchar](255) NOT NULL,
	[isAdmin] [bit] NULL,
	[address] [nvarchar](200) NULL,
	[phone] [nvarchar](12) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Puma')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Adidas')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Nike')
INSERT [dbo].[Category] ([id], [name]) VALUES (4, N'NewBalance')
INSERT [dbo].[Category] ([id], [name]) VALUES (5, N'Converse')
INSERT [dbo].[Category] ([id], [name]) VALUES (6, N'Vans')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([id], [amound], [accountid], [createdAt], [address], [note], [phone], [payMethod], [name]) VALUES (34, 215, NULL, CAST(N'2024-07-07T21:31:41.493' AS DateTime), N'awd', N'awd', N'awd', N'Check payments', N'awd')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [quantity], [productId], [orderId], [size], [color]) VALUES (29, 3, 27, 34, N'S', N'red')
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (2, N' Adidas Samba', N'/Sneaker/assets/images/ProductImg/samba2.jpg', 123, 62.1, N'Classic indoor soccer shoe with leather upper, grippy outsole, and EVA midsole.', 2)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (3, N'Adidas Continental 80', N'/Sneaker/assets/images/ProductImg/continental_80.jpg', 278, 27.71, N'Retro-inspired sneaker with leather upper, split rubber cupsole, and EVA insert.', 2)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (4, N'Adidas Falcon', N'/Sneaker/assets/images/ProductImg/falcon.jpg', 959, 3.7, N'Chunky sneaker with mesh and suede upper, EVA midsole, and Torsion System.',2)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (5, N'Adidas Ozweego', N'/Sneaker/assets/images/ProductImg/ozweego.jpg', 877, 32.57, N'Futuristic sneaker with mesh and textile upper, Adiprene+ cushioning, and sculpted midsole.', 2)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (7, N'Adidas Pureboost', N'/Sneaker/assets/images/ProductImg/pureboot.jpg', 267, 63.48, N'Running shoe with knit upper, Boost midsole, and Stretchweb outsole.', 2)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (9, N'Adidas Duramo', N'/Sneaker/assets/images/ProductImg/duramo.jpg', 55, 106.74, N'Versatile running shoe with mesh upper, Cloudfoam midsole, and Adiwear outsole.', 2)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (11, N'Adidas Ultimake', N'/Sneaker/assets/images/ProductImg/ultimate.jpg', 514, 165.09, N'Performance shoe with lightweight upper, Boost midsole, and Stretchweb outsole.', 2)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (12, N'Adidas Response', N'/Sneaker/assets/images/ProductImg/response.jpg', 562, 35.06, N'Comfortable running shoe with mesh upper, Bounce midsole, and rubber outsole.', 2)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (23, N'Adidas Stan Smith', N'/Sneaker/assets/images/ProductImg/stand_smith.jpg', 598, 85, N'Classic sneaker with leather upper and Ortholite insole.', 2)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (29, N'Nike Air Max SYSTM', N'/Sneaker/assets/images/ProductImg/nike1.jpg', 324, 99.99, N'Classic Air Max style with leather and textile upper, visible Air unit.', 3)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (30, N'Nike Court S Hot', N'/Sneaker/assets/images/ProductImg/nike2.jpg', 189, 79.95, N'Tennis-inspired shoe with leather upper, foam midsole, and herringbone outsole.', 3)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (31, N'Nike Court Vision Low', N'/Sneaker/assets/images/ProductImg/nike3.jpg', 456, 69.99, N'1980s basketball-inspired shoe with leather upper and rubber cupsole.', 3)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (32, N'Nike Ebermon Low', N'/Sneaker/assets/images/ProductImg/nike4.jpg', 215, 89.95, N'Low-profile shoe with leather and synthetic upper, cushioned midsole.', 3)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (33, N'Nike Pegamax', N'/Sneaker/assets/images/ProductImg/nike5.jpg', 278, 129.99, N'Running shoe with foam midsoleand engineered mesh upper.', 3)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (34, N'Nike Pesvus', N'/Sneaker/assets/images/ProductImg/nike6.jpg', 198, 119.95, N'Lightweight running shoe with mesh upper and responsive foam midsole.', 3)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (35, N'Nike Pegasus 41', N'/Sneaker/assets/images/ProductImg/nike7.jpg', 312, 119.99, N'Updated running shoe with foam midsole, Zoom Air unit, and mesh upper.', 3)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (36, N'Nike Quest', N'/Sneaker/assets/images/ProductImg/nike8.jpg', 245, 89.99, N'Reliable running shoe with lightweight mesh upper and foam midsole.', 3)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (37, N'Nike Rival Fly', N'/Sneaker/assets/images/ProductImg/nike9.jpg', 189, 99.95, N'Speed-focused running shoe with mesh upper and responsive foam midsole.', 3)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (38, N'Nike Run Swift', N'/Sneaker/assets/images/ProductImg/nike10.jpg', 267, 79.99, N'Comfortable running shoe with breathable mesh upper and foam midsole.', 3)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (39, N'Converse Classic', N'/Sneaker/assets/images/ProductImg/con7.jpg', 200, 60.00, N'The iconic Converse Classic sneaker.', 5)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (40, N'Converse Chuck 1970S', N'/Sneaker/assets/images/ProductImg/con1.jpg', 150, 85.00, N'A vintage-inspired version of the Chuck Taylor.', 5)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (41, N'Converse Chuck Taylor All Star Move', N'/Sneaker/assets/images/ProductImg/con4.jpg', 175, 75.00, N'Lightweight and platformed Chuck Taylor.', 5)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (42, N'Converse All Star Disrupt CX', N'/Sneaker/assets/images/ProductImg/con5.jpg', 120, 95.00, N'Innovative and futuristic Chuck Taylor.', 5)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (43, N'Converse Chuck Taylor All Star', N'/Sneaker/assets/images/ProductImg/con8.jpg', 220, 65.00, N'The original and timeless Chuck Taylor.', 5)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (44, N'Converse Chuck Taylor Cruise Mujer', N'/Sneaker/assets/images/ProductImg/con9.jpg', 100, 70.00, N'Chuck Taylor designed for women.', 5)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (45, N'Converse Chuck 70 Plus', N'/Sneaker/assets/images/ProductImg/con10.jpg', 130, 90.00, N'A modern take on the Chuck 70.', 5)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (46, N'Vans Classic', N'/Sneaker/assets/images/ProductImg/vans1.jpg', 180, 60.00, N'The timeless Vans Classic sneaker.', 6)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (47, N'Vans Caro', N'/Sneaker/assets/images/ProductImg/vans2.jpg', 160, 65.00, N'Vans with a classic checkerboard pattern.', 6)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (48, N'Vans Old Skool 36 DX Anaheim Factory', N'/Sneaker/assets/images/ProductImg/vans7.jpg', 140, 80.00, N'Vintage-inspired Vans Old Skool from the Anaheim Factory collection.', 6)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (49, N'Vans Authentic', N'/Sneaker/assets/images/ProductImg/vans8.jpg', 200, 55.00, N'The original Vans Authentic shoe.', 6)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (50, N'Vans Old Skool Multi Block', N'/Sneaker/assets/images/ProductImg/vans3.jpg', 120, 75.00, N'Vans Old Skool with a multi-block color design.', 6)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (51, N'Puma Shuffle', N'/Sneaker/assets/images/ProductImg/puma2.jpg', 150, 65.00, N'Classic Puma Shuffle sneakers.', 1)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (52, N'Puma Rebound', N'/Sneaker/assets/images/ProductImg/puma4.jpg', 130, 75.00, N'Puma Rebound basketball-inspired shoes.', 1)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (53, N'Puma RBD Game Low Sneakers', N'/Sneaker/assets/images/ProductImg/puma8.jpg', 110, 80.00, N'Puma RBD Game Low sneakers.', 1)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (54, N'Puma Smash Cat Perf', N'/Sneaker/assets/images/ProductImg/puma10.jpg', 170, 70.00, N'PUMA Smash Cat Perf sneakers.', 1)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (55, N'New Balance 530', N'/Sneaker/assets/images/ProductImg/balance530.jpg', 150, 95.00, N'New Balance 530 sneakers.', 4)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (56, N'New Balance 574 Classic', N'/Sneaker/assets/images/ProductImg/balance574.jpg', 120, 85.00, N'New Balance 574 Classic sneakers.', 4)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (57, N'New Balance 327 Sea Salt', N'/Sneaker/assets/images/ProductImg/balance327.jpg', 180, 110.00, N'New Balance 327 Sea Salt sneakers.', 4)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (58, N'New Balance Running', N'/Sneaker/assets/images/ProductImg/balancerunning.jpg', 200, 100.00, N'New Balance Running shoes.', 4)
INSERT [dbo].[Product] ([id], [name], [image], [quantity], [price], [description], [cate_id]) VALUES (59, N'New Balance Unisex', N'/Sneaker/assets/images/ProductImg/balnceunisex.jpg', 160, 90.00, N'New Balance Unisex sneakers.', 4);
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
-- Product 2 (Samba)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (2, N'White'), (2, N'Black'), (2, N'Red'), (2, N'Yellow'), (2, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (2, N'36'), (2, N'37'), (2, N'38'), (2, N'39'), (2, N'40'), (2, N'41'), (2, N'42');

-- Product 3 (Continental 80)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (3, N'White'), (3, N'Black'), (3, N'Red'), (3, N'Yellow'), (3, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (3, N'36'), (3, N'37'), (3, N'38'), (3, N'39'), (3, N'40'), (3, N'41'), (3, N'42');

-- Product 4 (Falcon)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (4, N'White'), (4, N'Black'), (4, N'Red'), (4, N'Yellow'), (4, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (4, N'36'), (4, N'37'), (4, N'38'), (4, N'39'), (4, N'40'), (4, N'41'), (4, N'42');

-- Product 5 (Ozweego)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (5, N'White'), (5, N'Black'), (5, N'Red'), (5, N'Yellow'), (5, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (5, N'36'), (5, N'37'), (5, N'38'), (5, N'39'), (5, N'40'), (5, N'41'), (5, N'42');

-- Product 7 (Pureboost)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (7, N'White'), (7, N'Black'), (7, N'Red'), (7, N'Yellow'), (7, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (7, N'36'), (7, N'37'), (7, N'38'), (7, N'39'), (7, N'40'), (7, N'41'), (7, N'42');

-- Product 8 (Solar Glide)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (8, N'White'), (8, N'Black'), (8, N'Red'), (8, N'Yellow'), (8, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (8, N'36'), (8, N'37'), (8, N'38'), (8, N'39'), (8, N'40'), (8, N'41'), (8, N'42');

-- Product 9 (Duramo)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (9, N'White'), (9, N'Black'), (9, N'Red'), (9, N'Yellow'), (9, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (9, N'36'), (9, N'37'), (9, N'38'), (9, N'39'), (9, N'40'), (9, N'41'), (9, N'42');

-- Product 11 (Ultimake)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (11, N'White'), (11, N'Black'), (11, N'Red'), (11, N'Yellow'), (11, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (11, N'36'), (11, N'37'), (11, N'38'), (11, N'39'), (11, N'40'), (11, N'41'), (11, N'42');

-- Product 12 (Response)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (12, N'White'), (12, N'Black'), (12, N'Red'), (12, N'Yellow'), (12, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (12, N'36'), (12, N'37'), (12, N'38'), (12, N'39'), (12, N'40'), (12, N'41'), (12, N'42');



-- Product 23 (Stan Smith)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (23, N'White'), (23, N'Black'), (23, N'Red'), (23, N'Yellow'), (23, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (23, N'36'), (23, N'37'), (23, N'38'), (23, N'39'), (23, N'40'), (23, N'41'), (23, N'42');

-- Nike Air Max SYSTM (29)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (29, N'White'), (29, N'Black'), (29, N'Red'), (29, N'Yellow'), (29, N'Grey'); 
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (29, N'36'), (29, N'37'), (29, N'38'), (29, N'39'), (29, N'40'), (29, N'41'), (29, N'42');

-- Nike Court S Hot (30)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (30, N'White'), (30, N'Black'), (30, N'Red'), (30, N'Yellow'), (30, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (30, N'36'), (30, N'37'), (30, N'38'), (30, N'39'), (30, N'40'), (30, N'41'), (30, N'42');

-- Nike Court Vision Low (31)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (31, N'White'), (31, N'Black'), (31, N'Red'), (31, N'Yellow'), (31, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (31, N'36'), (31, N'37'), (31, N'38'), (31, N'39'), (31, N'40'), (31, N'41'), (31, N'42');

-- Nike Ebermon Low (32)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (32, N'White'), (32, N'Black'), (32, N'Red'), (32, N'Yellow'), (32, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (32, N'36'), (32, N'37'), (32, N'38'), (32, N'39'), (32, N'40'), (32, N'41'), (32, N'42');

-- Nike Pegamax (33)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (33, N'White'), (33, N'Black'), (33, N'Red'), (33, N'Yellow'), (33, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (33, N'36'), (33, N'37'), (33, N'38'), (33, N'39'), (33, N'40'), (33, N'41'), (33, N'42');

-- Nike Pesvus (34)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (34, N'White'), (34, N'Black'), (34, N'Red'), (34, N'Yellow'), (34, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (34, N'36'), (34, N'37'), (34, N'38'), (34, N'39'), (34, N'40'), (34, N'41'), (34, N'42');

-- Nike Pegasus 41 (35)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (35, N'White'), (35, N'Black'), (35, N'Red'), (35, N'Yellow'), (35, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (35, N'36'), (35, N'37'), (35, N'38'), (35, N'39'), (35, N'40'), (35, N'41'), (35, N'42');

-- Nike Quest (36)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (36, N'White'), (36, N'Black'), (36, N'Red'), (36, N'Yellow'), (36, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (36, N'36'), (36, N'37'), (36, N'38'), (36, N'39'), (36, N'40'), (36, N'41'), (36, N'42');

-- Nike Rival Fly (37)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (37, N'White'), (37, N'Black'), (37, N'Red'), (37, N'Yellow'), (37, N'Grey'); 
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (37, N'36'), (37, N'37'), (37, N'38'), (37, N'39'), (37, N'40'), (37, N'41'), (37, N'42');

-- Nike Run Swift (38)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (38, N'White'), (38, N'Black'), (38, N'Red'), (38, N'Yellow'), (38, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (38, N'36'), (38, N'37'), (38, N'38'), (38, N'39'), (38, N'40'), (38, N'41'), (38, N'42');
-- Converse Classic (39)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (39, N'White'), (39, N'Black'), (39, N'Red'), (39, N'Yellow'), (39, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (39, N'35'), (39, N'36'), (39, N'37'), (39, N'38'), (39, N'39'), (39, N'40'), (39, N'41'), (39, N'42'), (39, N'43');

-- Converse Chuck 1970S (40)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (40, N'White'), (40, N'Black'), (40, N'Red'), (40, N'Yellow'), (40, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (40, N'36'), (40, N'37'), (40, N'38'), (40, N'39'), (40, N'40'), (40, N'41'), (40, N'42'), (40, N'43');

-- Converse Chuck Taylor All Star Move (41)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (41, N'White'), (41, N'Black'), (41, N'Red'), (41, N'Yellow'), (41, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (41, N'35'), (41, N'36'), (41, N'37'), (41, N'38'), (41, N'39'), (41, N'40');

-- Converse All Star Disrupt CX (42)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (42, N'White'), (42, N'Black'), (42, N'Red'), (42, N'Yellow'), (42, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (42, N'36'), (42, N'37'), (42, N'38'), (42, N'39'), (42, N'40'), (42, N'41'), (42, N'42');

-- Converse Chuck Taylor All Star (43)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (43, N'White'), (43, N'Black'), (43, N'Red'), (43, N'Yellow'), (43, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (43, N'35'), (43, N'36'), (43, N'37'), (43, N'38'), (43, N'39'), (43, N'40'), (43, N'41'), (43, N'42');

-- Converse Chuck Taylor Cruise Mujer (44)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (44, N'White'), (44, N'Black'), (44, N'Red'), (44, N'Yellow'), (44, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (44, N'35'), (44, N'36'), (44, N'37'), (44, N'38'), (44, N'39'), (44, N'40');

-- Converse Chuck 70 Plus (45)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (45, N'White'), (45, N'Black'), (45, N'Red'), (45, N'Yellow'), (45, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (45, N'36'), (45, N'37'), (45, N'38'), (45, N'39'), (45, N'40'), (45, N'41'), (45, N'42');

-- Vans Classic (46)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (46, N'White'), (46, N'Black'), (46, N'Red'), (46, N'Yellow'), (46, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (46, N'35'), (46, N'36'), (46, N'37'), (46, N'38'), (46, N'39'), (46, N'40'), (46, N'41'), (46, N'42');

-- Vans Caro (47)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (47, N'White'), (47, N'Black'), (47, N'Red'), (47, N'Yellow'), (47, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (47, N'35'), (47, N'36'), (47, N'37'), (47, N'38'), (47, N'39'), (47, N'40'), (47, N'41'), (47, N'42');

-- Vans Old Skool 36 DX Anaheim Factory (48)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (48, N'White'), (48, N'Black'), (48, N'Red'), (48, N'Yellow'), (48, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (48, N'36'), (48, N'37'), (48, N'38'), (48, N'39'), (48, N'40'), (48, N'41'), (48, N'42');

-- Vans Authentic (49)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (49, N'White'), (49, N'Black'), (49, N'Red'), (49, N'Yellow'), (49, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (49, N'35'), (49, N'36'), (49, N'37'), (49, N'38'), (49, N'39'), (49, N'40'), (49, N'41'), (49, N'42');

-- Vans Old Skool Multi Block (50)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (50, N'White'), (50, N'Black'), (50, N'Red'), (50, N'Yellow'), (50, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (50, N'36'), (50, N'37'), (50, N'38'), (50, N'39'), (50, N'40'), (50, N'41'), (50, N'42');

-- Puma Shuffle (51)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (51, N'White'), (51, N'Black'), (51, N'Red'), (51, N'Yellow'), (51, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (51, N'36'), (51, N'37'), (51, N'38'), (51, N'39'), (51, N'40'), (51, N'41'), (51, N'42');

-- Puma Rebound (52)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (52, N'White'), (52, N'Black'), (52, N'Red'), (52, N'Yellow'), (52, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (52, N'36'), (52, N'37'), (52, N'38'), (52, N'39'), (52, N'40'), (52, N'41'), (52, N'42');

-- Puma RBD Game Low Sneakers (53)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (53, N'White'), (53, N'Black'), (53, N'Red'), (53, N'Yellow'), (53, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (53, N'36'), (53, N'37'), (53, N'38'), (53, N'39'), (53, N'40'), (53, N'41'), (53, N'42');

-- PUMA Smash Cat Perf (54)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (54, N'White'), (54, N'Black'), (54, N'Red'), (54, N'Yellow'), (54, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (54, N'36'), (54, N'37'), (54, N'38'), (54, N'39'), (54, N'40'), (54, N'41'), (54, N'42');

-- New Balance 530 (55)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (55, N'White'), (55, N'Black'), (55, N'Red'), (55, N'Yellow'), (55, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (55, N'38'), (55, N'39'), (55, N'40'), (55, N'41'), (55, N'42'), (55, N'43'), (55, N'44');

-- New Balance 574 Classic (56)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (56, N'White'), (56, N'Black'), (56, N'Red'), (56, N'Yellow'), (56, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (56, N'37'), (56, N'38'), (56, N'39'), (56, N'40'), (56, N'41'), (56, N'42');

-- New Balance 327 Sea Salt (57)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (57, N'White'), (57, N'Black'), (57, N'Red'), (57, N'Yellow'), (57, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (57, N'36'), (57, N'37'), (57, N'38'), (57, N'39'), (57, N'40'), (57, N'41');

-- New Balance Running (58)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (58, N'White'), (58, N'Black'), (58, N'Red'), (58, N'Yellow'), (58, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (58, N'40'), (58, N'41'), (58, N'42'), (58, N'43'), (58, N'44'), (58, N'45');

-- New Balance Unisex (59)
INSERT [dbo].[product_color] ([product_id], [color]) VALUES (59, N'White'), (59, N'Black'), (59, N'Red'), (59, N'Yellow'), (59, N'Grey');
INSERT [dbo].[product_size] ([product_id], [size]) VALUES (59, N'35'), (59, N'36'), (59, N'37'), (59, N'38'), (59, N'39'), (59, N'40');
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [address], [phone]) VALUES (1, N'Admin', N'admin123@gmail.com', N'admin', 1, N'123', N'01111111')
INSERT [dbo].[User] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [address], [phone]) VALUES (11, N'username', N'userEmail', N'123', 0, N'abc', N'123')
INSERT [dbo].[User] ([user_id], [user_name], [user_email], [user_pass], [isAdmin], [address], [phone]) VALUES (12, N'user', N'user@gmail.com', N'123', 0, N'Nghe an', N'0999999999')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([accountid])
REFERENCES [dbo].[User] ([user_id])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([cate_id])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[product_color]  WITH CHECK ADD  CONSTRAINT [FK_product_color_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product_color] CHECK CONSTRAINT [FK_product_color_Product]
GO
ALTER TABLE [dbo].[product_size]  WITH CHECK ADD  CONSTRAINT [FK_product_size_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product_size] CHECK CONSTRAINT [FK_product_size_Product]
GO