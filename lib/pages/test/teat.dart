





// this test body for gemini chat 
// 
// Column(
//         children: [
//           Expanded(
//             flex: 10,
//             child: ListView.builder(
//               reverse: true,
//               itemCount: chatList.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(chatList[index].isMe ? "Me" : "Gemini"),
//                   subtitle: chatList[index].base64EncodedImage != null
//                       ? Column(
//                           children: [
//                             Image.memory(
//                               base64Decode(chatList[index].base64EncodedImage!),
//                               height: 300,
//                               width: double.infinity,
//                             ),
//                             Text(chatList[index].message),
//                           ],
//                         )
//                       : Text(chatList[index].message),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Container(
//             color: KprimaryColor2,
//             height: 80,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: controller,
//                     decoration: InputDecoration(
//                       prefixIcon: IconButton(
//                         onPressed: () {
//                           selectImage();
//                         },
//                         icon: Icon(Icons.upload_file),
//                       ),
//                       hintText: "Message",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(30),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     onSendMessage();
//                   },
//                   icon: const Icon(Icons.send),
//                 ),
//               ],
//             ),
//           ),
//           // const SizedBox(
//           //   height: 10,
//           // )
//         ],