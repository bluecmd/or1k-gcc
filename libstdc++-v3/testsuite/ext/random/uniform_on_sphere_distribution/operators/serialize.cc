// { dg-options "-std=gnu++11" }
// { dg-require-cstdint "" }
//
// 2014-04-15  Ulrich Drepper  <drepper@gmail.com>
//
// Copyright (C) 2014 Free Software Foundation, Inc.
//
// This file is part of the GNU ISO C++ Library.  This library is free
// software; you can redistribute it and/or modify it under the
// terms of the GNU General Public License as published by the
// Free Software Foundation; either version 3, or (at your option)
// any later version.
//
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License along
// with this library; see the file COPYING3.  If not see
// <http://www.gnu.org/licenses/>.

// 26.4.8.3.* Class template uniform_on_sphere_distribution [rand.dist.ext.uniform_on_sphere]
// 26.4.2.4 Concept RandomNumberDistribution [rand.concept.dist]

#include <ext/random>
#include <sstream>
#include <testsuite_hooks.h>

void
test01()
{
  bool test [[gnu::unused]] = true;

  std::stringstream str;
  __gnu_cxx::uniform_on_sphere_distribution<3> u, v;
  std::minstd_rand0 rng;

  u(rng); // advance
  str << u;

  str >> v;
}

int
main()
{
  test01();
  return 0;
}
