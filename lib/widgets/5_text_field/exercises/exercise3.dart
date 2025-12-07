import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: LayoutMenu()),
  );
}

// ==========================================
// MAIN MENU
// ==========================================
class LayoutMenu extends StatelessWidget {
  const LayoutMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Layout & Widget Exercises")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfilePageExample()),
              ),
              child: const Text("Ex 1: Profile (Stack & Positioned)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProductCardExample()),
              ),
              child: const Text("Ex 2: Product (Column, Row, Image)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NewsArticleExample()),
              ),
              child: const Text("Ex 3: News (Text.Rich & Padding)"),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// EXERCISE 1: Profile Page
// Focus: Stack, Positioned, Container decoration
// ==========================================
class ProfilePageExample extends StatelessWidget {
  const ProfilePageExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile Layout")),
      body: Column(
        children: [
          // STACK: Allows elements to overlap (Banner + Avatar)
          Stack(
            alignment: Alignment
                .bottomCenter, // Aligns children to bottom center of stack
            clipBehavior: Clip.none, // Allows Avatar to hang off the bottom
            children: [
              // 1. Background Banner
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  // Gradient for fancy look
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Image.network(
                  "https://picsum.photos/id/1018/400/200",
                  fit: BoxFit.cover,
                ),
              ),
              // 2. Profile Picture (Positioned to overlap)
              const Positioned(
                bottom: -50, // Moves it down 50px past the container edge
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white, // White border effect
                  child: CircleAvatar(
                    radius: 46,
                    backgroundImage: NetworkImage(
                      "https://picsum.photos/id/1005/200/200",
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Spacer for the avatar that is hanging down
          const SizedBox(height: 60),

          // TEXT CONTENT
          const Text(
            "Jane Flutter",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            "UI/UX Designer",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 20),

          // ROW: Stats layout
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("245", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Posts"),
                ],
              ),
              Column(
                children: [
                  Text("12k", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Followers"),
                ],
              ),
              Column(
                children: [
                  Text("500", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Following"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// EXERCISE 2: Product Card
// Focus: Container (Card look), Column vs Row, Image
// ==========================================
class ProductCardExample extends StatelessWidget {
  const ProductCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text("Product Card")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          // CONTAINER: Used to create the white card shape
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            // COLUMN: Vertically stacks Image -> Title -> Price
            child: Column(
              mainAxisSize: MainAxisSize.min, // Shrinks height to fit content
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // PRODUCT IMAGE with Stack for "Sale" badge
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      child: Image.network(
                        "https://picsum.photos/id/21/600/400", // Shoes
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        color: Colors.red,
                        child: const Text(
                          "SALE -50%",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // CONTENT SECTION
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Classic Running Shoes",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "Comfortable and stylish sneakers for everyday use.",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 15),

                      // ROW: Price on left, Rating on right
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "\$49.99",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              Text(
                                " 4.8",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ==========================================
// EXERCISE 3: News Article
// Focus: Text.Rich (Mixed styles), Padding, Row alignment
// ==========================================
class NewsArticleExample extends StatelessWidget {
  const NewsArticleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News Article")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "https://picsum.photos/id/180/800/400",
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The Future of Flutter",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // ROW: Author info
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://picsum.photos/id/64/100/100",
                        ),
                        radius: 20,
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "By Alex Code",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Dec 07, 2025 • 5 min read",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const Divider(height: 40),

                  // TEXT.RICH: Allows different styles in one paragraph
                  const Text.rich(
                    TextSpan(
                      text: "Flutter ",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        height: 1.5,
                      ), // Default style
                      children: [
                        TextSpan(
                          text: "transforming mobile development ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: "by allowing developers to create "),
                        TextSpan(
                          text: "beautiful native apps ",
                          style: TextStyle(
                            color: Colors.blue,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextSpan(text: "in record time.\n\n"),
                        TextSpan(
                          text:
                              "Unlike other frameworks, Flutter uses its own rendering engine to draw widgets. This means ",
                        ),
                        TextSpan(
                          text: "total control ",
                          style: TextStyle(
                            backgroundColor: Colors.yellow,
                          ), // Highlight effect
                        ),
                        TextSpan(text: "over every pixel on the screen."),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
