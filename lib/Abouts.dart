
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return

      Expanded(child: Padding(padding:const EdgeInsets.only(left: 15,right: 15),child: ListView(

        children: [
          const SizedBox(height: 30),
          const CircleAvatar(
            radius: 180,
          backgroundImage: AssetImage('images/icons.png'),
                    ),

          const SizedBox(height: 16),
          const Text(
            'عروض وتخفيضات اليمن',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            textAlign: TextAlign.center,
            'نحن نسعى لتوفير أفضل العروض والتخفيضات. بفضل شراكتنا مع مجموعة واسعة من المتاجر والشركات، نقدم لك أحدث الصفقات والتخفيضات على منتجات وخدمات متنوعة ',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const Text(
            textAlign: TextAlign.end,
            ':مهمتنا',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            textAlign: TextAlign.center,
            'تمكين العملاء من توفير المال والحصول على أفضل الصفقات ، وذلك عن طريق تقديم معلومات شاملة عن العروض والتخفيضات الحالية في المتاجر المختلفة.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const Text(
            textAlign: TextAlign.end,
            ':المميزات',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            textAlign: TextAlign.end,
            ' .تجربة تسوق مريحة وسهلة لاكتشاف أحدث العروض والتخفيضات-',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            textAlign: TextAlign.end,
            '.إشعارات فورية بالعروض الجديدة والتخفيضات الحصرية -',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            textAlign: TextAlign.end,
            '. تصفح العروض حسب الفئة أو المتجر المفضل لديك -',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          const Text(
            textAlign: TextAlign.end,
            '. يمكنك مشاركة العروض مع الاخرين -',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          const Text(
            textAlign: TextAlign.end,
            ':لتواصل معنا',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.mail, color: Colors.blue),
              const SizedBox(width: 8),
             Container(
               width: MediaQuery.of(context).size.width * 0.8,
               constraints: const BoxConstraints(
                 maxWidth: double.infinity
               ),
               child:const Text(
               textAlign: TextAlign.center,
               maxLines: 2,
               overflow: TextOverflow.ellipsis,
               'البريد الإلكتروني: oyapp.yem@gmail.com',
               style: TextStyle(fontSize: 16,),
             ) ,) ,
            ],
          ),
          const SizedBox(height: 8),

          Container(
            height: 20,
            alignment: Alignment.bottomCenter,
            child: const Text(
              'جميع الحقوق محفوظة © 2024',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
          const SizedBox(height:30),
        ],
      )));
  }
}