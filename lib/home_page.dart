import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.red,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 8,
                    childAspectRatio: screenHeight * 1 / screenWidth * 1,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  itemCount: 8 * 6,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.orange,
                      child: Center(
                        child: Text((index).toString()),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(child: Center(child: Text('Hello world!'))),
          ],
        ),
      ),
    );
  }
}

// Container(
//         width: screenWidth * 0.8,
//         height: screenHeight * 0.4,
//         child: Column(
//           children: [
//             Expanded(
//               child: Row(
//                 children: List.generate(8, (index) {
//                   if (index == 0) {
//                     return Expanded(
//                       child: Container(
//                         color: Colors.red,
//                       ),
//                     );
//                   }

//                   return Expanded(
//                     child: Container(
//                       color: Colors.blue,
//                       child: Center(
//                         child: Text((index).toString()),
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//             Expanded(
//               flex: 5,
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 1,
//                     child: Column(
//                       children: List.generate(5, (index) {
//                         return Expanded(
//                           child: Container(
//                             color: Colors.blue,
//                             child: Center(
//                               child: Text((index + 1).toString()),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 7,
//                     child: GridView.extent(
//                       maxCrossAxisExtent: screenHeight * 0.1,
//                       children: List.generate(35, (index) {
//                         return Container(
//                           color: Colors.orange,
//                           child: Center(
//                             child: Text((index + 1).toString()),
//                           ),
//                         );
//                       }),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),