import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FinTrackAI Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // TODO: Implement notification logic
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // TODO: Implement user profile logic
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Welcome Back!",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 24),
            _buildSummaryCards(context),
            const SizedBox(height: 24),
            _buildActions(context),
            const SizedBox(height: 24),
            Text(
              "Recent Transactions",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: 16),
            _buildRecentTransactions(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Implement CSV upload functionality
        },
        label: const Text("Upload Statement"),
        icon: const Icon(Icons.upload_file),
      ),
    );
  }

  Widget _buildSummaryCards(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      children: const [
        SummaryCard(
          title: "Total Income",
          value: "₹1,20,000",
          icon: Icons.arrow_upward,
          color: Colors.green,
        ),
        SummaryCard(
          title: "Total Expenses",
          value: "₹45,000",
          icon: Icons.arrow_downward,
          color: Colors.red,
        ),
        SummaryCard(
          title: "GST Payable",
          value: "₹13,500",
          icon: Icons.receipt,
          color: Colors.orange,
        ),
      ],
    );
  }

  Widget _buildActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ActionButton(
          icon: Icons.picture_as_pdf,
          label: "Generate Report",
          onPressed: () {
            // TODO: Implement report generation
          },
        ),
        ActionButton(
          icon: Icons.add_box,
          label: "Add Transaction",
          onPressed: () {
            // TODO: Implement manual transaction entry
          },
        ),
      ],
    );
  }

  Widget _buildRecentTransactions(BuildContext context) {
    // Placeholder for recent transactions list
    return Card(
      child: Column(
        children: List.generate(5, (index) {
          return ListTile(
            leading: CircleAvatar(
              child: Icon(index % 2 == 0 ? Icons.shopping_cart : Icons.work),
            ),
            title: Text("Transaction #${index + 1}"),
            subtitle: const Text("Auto-categorized expense"),
            trailing: Text(
              "- ₹${(index + 1) * 1234}",
              style: const TextStyle(color: Colors.red),
            ),
          );
        }),
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Icon(icon, color: color),
              ],
            ),
            Text(
              value,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(label),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
    );
  }
}
