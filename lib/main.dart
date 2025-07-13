import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class PortfolioItem {
  final String imageUrl;
  final String title;
  PortfolioItem({required this.imageUrl, required this.title});
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Professional UI V2',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color(0xFFF5F5F7),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: const Color(0xFF222222)),
      ),
      home: const ProfessionalProfilePageV2(),
    );
  }
}

class ProfessionalProfilePageV2 extends StatefulWidget {
  const ProfessionalProfilePageV2({super.key});

  @override
  State<ProfessionalProfilePageV2> createState() =>
      _ProfessionalProfilePageV2State();
}

class _ProfessionalProfilePageV2State extends State<ProfessionalProfilePageV2>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<PortfolioItem> portfolioItems = [
    PortfolioItem(
      imageUrl: 'https://picsum.photos/seed/lily1/400/500',
      title: 'Stargazer Array',
    ),
    PortfolioItem(
      imageUrl: 'https://picsum.photos/seed/lily2/400/500',
      title: 'Morning Dew',
    ),
    PortfolioItem(
      imageUrl: 'https://picsum.photos/seed/lily3/400/500',
      title: 'Sunset Petals',
    ),
    PortfolioItem(
      imageUrl: 'https://picsum.photos/seed/lily4/400/500',
      title: 'Pink Elegance',
    ),
    PortfolioItem(
      imageUrl: 'https://picsum.photos/seed/lily5/400/500',
      title: 'Garden Dream',
    ),
    PortfolioItem(
      imageUrl: 'https://picsum.photos/seed/lily6/400/500',
      title: 'White Purity',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: Text(
          "Hire Me",
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverPersistentHeader(
            delegate: _SliverTabBarDelegate(
              TabBar(
                controller: _tabController,
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black87,
                indicatorWeight: 2.5,
                tabs: const [
                  Tab(icon: Icon(Icons.grid_view_rounded), text: 'Portfolio'),
                  Tab(icon: Icon(Icons.person_outline_rounded), text: 'About'),
                  Tab(icon: Icon(Icons.mail_outline_rounded), text: 'Contact'),
                ],
              ),
            ),
            pinned: true,
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPortfolioTab(),
                _buildAboutTab(),
                _buildContactTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 250.0,
      floating: false,
      pinned: true,
      backgroundColor: const Color(0xFF222222),
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.only(bottom: 65),
        title: Text(
          'Lili Rahmianti',
          style: GoogleFonts.inter(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://picsum.photos/seed/profile/800/600',
              fit: BoxFit.cover,
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[Colors.transparent, Colors.black87],
                  stops: [0.5, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPortfolioTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.8,
      ),
      itemCount: portfolioItems.length,
      itemBuilder: (context, index) {
        final item = portfolioItems[index];
        return AnimatedCard(
          index: index,
          child: InkWell(
            onTap: () {},
            splashColor: Colors.black12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0), // Memberi jarak/bingkai
                    child: ClipRRect(
                      // Membuat sudut gambar tumpul
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        item.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    12.0,
                    0,
                    12.0,
                    12.0,
                  ), // Padding diatur ulang
                  child: Text(
                    item.title,
                    style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAboutTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            'Lili Rahmianti is a passionate florist and botanical stylist based in Jakarta. With a deep love for nature\'s artistry, she specializes in creating breathtaking floral arrangements that tell a story and evoke emotion.',
            style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black54),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Divider(),
          ),
          Text(
            'Specialties',
            style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildInfoTile(Icons.eco_outlined, 'Sustainable Floristry'),
          _buildInfoTile(Icons.celebration_outlined, 'Event & Wedding Styling'),
          _buildInfoTile(Icons.class_outlined, 'Floral Arrangement Workshops'),
        ],
      ),
    );
  }

  Widget _buildContactTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Get In Touch',
            style: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildInfoTile(Icons.email_outlined, 'lili.rahmianti@florist.com'),
          _buildInfoTile(Icons.phone_outlined, '+62 812 3456 7890'),
          _buildInfoTile(Icons.location_on_outlined, 'Jakarta, Indonesia'),
        ],
      ),
    );
  }

  Widget _buildInfoTile(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.black54, size: 20),
          const SizedBox(width: 16),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabBarDelegate(this._tabBar);
  final TabBar _tabBar;
  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 2)),
      ),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) => false;
}

class AnimatedCard extends StatefulWidget {
  final int index;
  final Widget child;
  const AnimatedCard({super.key, required this.index, required this.child});

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool _animate = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 100 * widget.index), () {
      if (mounted) {
        setState(() {
          _animate = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 400),
      opacity: _animate ? 1 : 0,
      curve: Curves.easeInOut,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        transform: Matrix4.translationValues(0, _animate ? 0 : 20, 0),
        curve: Curves.easeInOut,
        child: Card(
          elevation: 4,
          clipBehavior: Clip.antiAlias,
          shadowColor: Colors.black26,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
