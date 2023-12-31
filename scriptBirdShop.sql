drop database [BirdShopCrea]
create database [BirdShopCrea]
USE [BirdShopCrea]
GO
/****** Object:  Table [dbo].[address]    Script Date: 10/30/2023 8:53:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](255) NOT NULL,
	[address_shipping] [varchar](255) NOT NULL,
	[name] [nvarchar](10) NOT NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 10/30/2023 8:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 10/30/2023 8:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id] [varchar](255) NOT NULL,
	[address_id] [int] NOT NULL,
	[user_id] [varchar](255) NOT NULL,
	[shipping_address] [text] NOT NULL,
	[orderdate] [date] NOT NULL,
	[payment_method] [bit] NOT NULL,
	[order_total] [numeric](10, 2) NOT NULL,
	[order_status] [int] NOT NULL,
	[name] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_item]    Script Date: 10/30/2023 8:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_item_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [numeric](10, 2) NOT NULL,
	[order_detail_id] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_item]    Script Date: 10/30/2023 8:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_item](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category_id] [int] NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[amount] [int] NOT NULL,
	[price] [numeric](10, 2) NOT NULL,
	[product_image] [varchar](255) NOT NULL,
	[is_customer] [bit] NULL,
	[is_post] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 10/30/2023 8:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_review]    Script Date: 10/30/2023 8:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_review](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [varchar](255) NOT NULL,
	[product_item_id] [int] NOT NULL,
	[rating_value] [real] NOT NULL,
	[comment] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 10/30/2023 8:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[user_id] [varchar](255) NOT NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 10/30/2023 8:53:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [varchar](255) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[phone] [varchar](255) NOT NULL,
	[is_excuted] [bit] NULL,
	[otp_email] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[address] ON 

INSERT [dbo].[address] ([id], [user_id], [address_shipping], [name], [email], [phone]) VALUES (2, N'thaitvqse173119@fpt.edu.vn', N'123 Street, City', N'John Doe', N'john@example.com', N'1234567890')
SET IDENTITY_INSERT [dbo].[address] OFF
GO
INSERT [dbo].[category] ([id], [name]) VALUES (1, N'Category 1')
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'Category 2')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'Category 3')
GO
INSERT [dbo].[order_detail] ([id], [address_id], [user_id], [shipping_address], [orderdate], [payment_method], [order_total], [order_status], [name]) VALUES (N'nKBTj', 2, N'thaitvqse173119@fpt.edu.vn', N'123 Main St', CAST(N'2023-10-30' AS Date), 1, CAST(129.95 AS Numeric(10, 2)), 1, NULL)
INSERT [dbo].[order_detail] ([id], [address_id], [user_id], [shipping_address], [orderdate], [payment_method], [order_total], [order_status], [name]) VALUES (N'u9eFw', 2, N'thaitvqse173119@fpt.edu.vn', N'123 Main St', CAST(N'2023-10-30' AS Date), 1, CAST(329.90 AS Numeric(10, 2)), 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[order_item] ON 

INSERT [dbo].[order_item] ([id], [product_item_id], [quantity], [price], [order_detail_id]) VALUES (5, 1, 2, CAST(19.99 AS Numeric(10, 2)), N'nKBTj')
INSERT [dbo].[order_item] ([id], [product_item_id], [quantity], [price], [order_detail_id]) VALUES (6, 2, 3, CAST(29.99 AS Numeric(10, 2)), N'nKBTj')
INSERT [dbo].[order_item] ([id], [product_item_id], [quantity], [price], [order_detail_id]) VALUES (7, 1, 2, CAST(19.99 AS Numeric(10, 2)), N'u9eFw')
INSERT [dbo].[order_item] ([id], [product_item_id], [quantity], [price], [order_detail_id]) VALUES (8, 2, 3, CAST(29.99 AS Numeric(10, 2)), N'u9eFw')
INSERT [dbo].[order_item] ([id], [product_item_id], [quantity], [price], [order_detail_id]) VALUES (9, 3, 5, CAST(39.99 AS Numeric(10, 2)), N'u9eFw')
SET IDENTITY_INSERT [dbo].[order_item] OFF
GO
SET IDENTITY_INSERT [dbo].[product_item] ON 

INSERT [dbo].[product_item] ([id], [category_id], [name], [description], [amount], [price], [product_image], [is_customer], [is_post]) VALUES (1, 1, N'Product A', N'Description for Product A', 50, CAST(19.99 AS Numeric(10, 2)), N'productA.jpg', 1, 0)
INSERT [dbo].[product_item] ([id], [category_id], [name], [description], [amount], [price], [product_image], [is_customer], [is_post]) VALUES (2, 1, N'Product B', N'Description for Product B', 30, CAST(29.99 AS Numeric(10, 2)), N'productB.jpg', 0, 0)
INSERT [dbo].[product_item] ([id], [category_id], [name], [description], [amount], [price], [product_image], [is_customer], [is_post]) VALUES (3, 2, N'Chimm', N'Description for Product C', 20, CAST(39.99 AS Numeric(10, 2)), N'productC.jpg', 1, 1)
SET IDENTITY_INSERT [dbo].[product_item] OFF
GO
INSERT [dbo].[roles] ([id], [name]) VALUES (1, N'USER')
INSERT [dbo].[roles] ([id], [name]) VALUES (2, N'ADMIN')
GO
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (N'thaitvqse173@fpt.edu.vn', 1)
INSERT [dbo].[user_role] ([user_id], [role_id]) VALUES (N'thaitvqse173119@fpt.edu.vn', 1)
GO
INSERT [dbo].[users] ([user_id], [username], [password], [email], [phone], [is_excuted], [otp_email]) VALUES (N'thaitvqse173@fpt.edu.vn', N'QuangThai', N'$2a$10$46iJksep8mmfWnRo/vwc3.JHwWKa89P5KCS2eKAv8d9HuHENJKX6.', N'thaitvqse173@fpt.edu.vn', N'0847123169', 0, N'995027')
INSERT [dbo].[users] ([user_id], [username], [password], [email], [phone], [is_excuted], [otp_email]) VALUES (N'thaitvqse173119@fpt.edu.vn', N'Quang thai change', N'$2a$10$WqwHzBgs/f8RDbC/TX/K4umQ5/cwKoT81t.MPp4P5uL3CzldYm4w2', N'thaitvqse173119@fpt.edu.vn', N'0847123169', 1, NULL)
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([id])
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[order_item]  WITH CHECK ADD FOREIGN KEY([order_detail_id])
REFERENCES [dbo].[order_detail] ([id])
GO
ALTER TABLE [dbo].[order_item]  WITH CHECK ADD FOREIGN KEY([product_item_id])
REFERENCES [dbo].[product_item] ([id])
GO
ALTER TABLE [dbo].[product_item]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[user_review]  WITH CHECK ADD FOREIGN KEY([product_item_id])
REFERENCES [dbo].[product_item] ([id])
GO
ALTER TABLE [dbo].[user_review]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([user_id])
GO
