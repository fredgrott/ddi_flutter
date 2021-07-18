// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Note: material apps still use the typography class for the
//       default text styles which are:
//           BlackMountainView WhiteMountainView android, fuschia
//           BlackRedmond WhiteRedmond MS Windows
//           BlackHelsinki WhiteHelsinki Linux

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// TextTheme defines the typography styles defined in MD so this 
// just re-assigns those styles to use NotoSans fonts
final TextTheme myMaterialTextTheme = GoogleFonts.notoSansTextTheme();
