locals {
  # https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html#AvailableIpPerENI
  # instance_type   = [max_enis, private_ipv4_addrs_per_eni]
  ips_per_eni_per_instance_type = {
    "a1.medium"     = [2, 4]
    "a1.large"      = [3, 10]
    "a1.xlarge"     = [4, 15]
    "a1.2xlarge"    = [4, 15]
    "a1.4xlarge"    = [8, 30]
    "a1.metal"      = [8, 30]
    "c1.medium"     = [2, 6]
    "c1.xlarge"     = [4, 15]
    "c3.large"      = [3, 10]
    "c3.xlarge"     = [4, 15]
    "c3.2xlarge"    = [4, 15]
    "c3.4xlarge"    = [8, 30]
    "c3.8xlarge"    = [8, 30]
    "c4.large"      = [3, 10]
    "c4.xlarge"     = [4, 15]
    "c4.2xlarge"    = [4, 15]
    "c4.4xlarge"    = [8, 30]
    "c4.8xlarge"    = [8, 30]
    "c5.large"      = [3, 10]
    "c5.xlarge"     = [4, 15]
    "c5.2xlarge"    = [4, 15]
    "c5.4xlarge"    = [8, 30]
    "c5.9xlarge"    = [8, 30]
    "c5.12xlarge"   = [8, 30]
    "c5.18xlarge"   = [15, 50]
    "c5.24xlarge"   = [15, 50]
    "c5.metal"      = [15, 50]
    "c5a.large"     = [3, 10]
    "c5a.xlarge"    = [4, 15]
    "c5a.2xlarge"   = [4, 15]
    "c5a.4xlarge"   = [8, 30]
    "c5a.8xlarge"   = [8, 30]
    "c5a.12xlarge"  = [8, 30]
    "c5a.16xlarge"  = [15, 50]
    "c5a.24xlarge"  = [15, 50]
    "c5ad.large"    = [3, 10]
    "c5ad.xlarge"   = [4, 15]
    "c5ad.2xlarge"  = [4, 15]
    "c5ad.4xlarge"  = [8, 30]
    "c5ad.8xlarge"  = [8, 30]
    "c5ad.12xlarge" = [8, 30]
    "c5ad.16xlarge" = [15, 50]
    "c5ad.24xlarge" = [15, 50]
    "c5d.large"     = [3, 10]
    "c5d.xlarge"    = [4, 15]
    "c5d.2xlarge"   = [4, 15]
    "c5d.4xlarge"   = [8, 30]
    "c5d.9xlarge"   = [8, 30]
    "c5d.12xlarge"  = [8, 30]
    "c5d.18xlarge"  = [15, 50]
    "c5d.24xlarge"  = [15, 50]
    "c5d.metal"     = [15, 50]
    "c5n.large"     = [3, 10]
    "c5n.xlarge"    = [4, 15]
    "c5n.2xlarge"   = [4, 15]
    "c5n.4xlarge"   = [8, 30]
    "c5n.9xlarge"   = [8, 30]
    "c5n.18xlarge"  = [15, 50]
    "c5n.metal"     = [15, 50]
    "c6g.medium"    = [2, 4]
    "c6g.large"     = [3, 10]
    "c6g.xlarge"    = [4, 15]
    "c6g.2xlarge"   = [4, 15]
    "c6g.4xlarge"   = [8, 30]
    "c6g.8xlarge"   = [8, 30]
    "c6g.12xlarge"  = [8, 30]
    "c6g.16xlarge"  = [15, 50]
    "c6g.metal"     = [15, 50]
    "c6gd.medium"   = [2, 4]
    "c6gd.large"    = [3, 10]
    "c6gd.xlarge"   = [4, 15]
    "c6gd.2xlarge"  = [4, 15]
    "c6gd.4xlarge"  = [8, 30]
    "c6gd.8xlarge"  = [8, 30]
    "c6gd.12xlarge" = [8, 30]
    "c6gd.16xlarge" = [15, 50]
    "c6gd.metal"    = [15, 50]
    "cc2.8xlarge"   = [8, 30]
    "cr1.8xlarge"   = [8, 30]
    "d2.xlarge"     = [4, 15]
    "d2.2xlarge"    = [4, 15]
    "d2.4xlarge"    = [8, 30]
    "d2.8xlarge"    = [8, 30]
    "f1.2xlarge"    = [4, 15]
    "f1.4xlarge"    = [8, 30]
    "f1.16xlarge"   = [8, 50]
    "g2.2xlarge"    = [4, 15]
    "g2.8xlarge"    = [8, 30]
    "g3s.xlarge"    = [4, 15]
    "g3.4xlarge"    = [8, 30]
    "g3.8xlarge"    = [8, 30]
    "g3.16xlarge"   = [15, 50]
    "g4dn.xlarge"   = [3, 10]
    "g4dn.2xlarge"  = [3, 10]
    "g4dn.4xlarge"  = [3, 10]
    "g4dn.8xlarge"  = [4, 15]
    "g4dn.12xlarge" = [8, 30]
    "g4dn.16xlarge" = [4, 15]
    "g4dn.metal"    = [15, 50]
    "h1.2xlarge"    = [4, 15]
    "h1.4xlarge"    = [8, 30]
    "h1.8xlarge"    = [8, 30]
    "h1.16xlarge"   = [15, 50]
    "hs1.8xlarge"   = [8, 30]
    "i2.xlarge"     = [4, 15]
    "i2.2xlarge"    = [4, 15]
    "i2.4xlarge"    = [8, 30]
    "i2.8xlarge"    = [8, 30]
    "i3.large"      = [3, 10]
    "i3.xlarge"     = [4, 15]
    "i3.2xlarge"    = [4, 15]
    "i3.4xlarge"    = [8, 30]
    "i3.8xlarge"    = [8, 30]
    "i3.16xlarge"   = [15, 50]
    "i3.metal"      = [15, 50]
    "i3en.large"    = [3, 10]
    "i3en.xlarge"   = [4, 15]
    "i3en.2xlarge"  = [4, 15]
    "i3en.3xlarge"  = [4, 15]
    "i3en.6xlarge"  = [8, 30]
    "i3en.12xlarge" = [8, 30]
    "i3en.24xlarge" = [15, 50]
    "i3en.metal"    = [15, 50]
    "inf1.xlarge"   = [4, 10]
    "inf1.2xlarge"  = [4, 10]
    "inf1.6xlarge"  = [8, 30]
    "inf1.24xlarge" = [15, 30]
    "m1.small"      = [2, 4]
    "m1.medium"     = [2, 6]
    "m1.large"      = [3, 10]
    "m1.xlarge"     = [4, 15]
    "m2.xlarge"     = [4, 15]
    "m2.2xlarge"    = [4, 30]
    "m2.4xlarge"    = [8, 30]
    "m3.medium"     = [2, 6]
    "m3.large"      = [3, 10]
    "m3.xlarge"     = [4, 15]
    "m3.2xlarge"    = [4, 30]
    "m4.large"      = [2, 10]
    "m4.xlarge"     = [4, 15]
    "m4.2xlarge"    = [4, 15]
    "m4.4xlarge"    = [8, 30]
    "m4.10xlarge"   = [8, 30]
    "m4.16xlarge"   = [8, 30]
    "m5.large"      = [3, 10]
    "m5.xlarge"     = [4, 15]
    "m5.2xlarge"    = [4, 15]
    "m5.4xlarge"    = [8, 30]
    "m5.8xlarge"    = [8, 30]
    "m5.12xlarge"   = [8, 30]
    "m5.16xlarge"   = [15, 50]
    "m5.24xlarge"   = [15, 50]
    "m5.metal"      = [15, 50]
    "m5a.large"     = [3, 10]
    "m5a.xlarge"    = [4, 15]
    "m5a.2xlarge"   = [4, 15]
    "m5a.4xlarge"   = [8, 30]
    "m5a.8xlarge"   = [8, 30]
    "m5a.12xlarge"  = [8, 30]
    "m5a.16xlarge"  = [15, 50]
    "m5a.24xlarge"  = [15, 50]
    "m5ad.large"    = [3, 10]
    "m5ad.xlarge"   = [4, 15]
    "m5ad.2xlarge"  = [4, 15]
    "m5ad.4xlarge"  = [8, 30]
    "m5ad.8xlarge"  = [8, 30]
    "m5ad.12xlarge" = [8, 30]
    "m5ad.16xlarge" = [15, 50]
    "m5ad.24xlarge" = [15, 50]
    "m5d.large"     = [3, 10]
    "m5d.xlarge"    = [4, 15]
    "m5d.2xlarge"   = [4, 15]
    "m5d.4xlarge"   = [8, 30]
    "m5d.8xlarge"   = [8, 30]
    "m5d.12xlarge"  = [8, 30]
    "m5d.16xlarge"  = [15, 50]
    "m5d.24xlarge"  = [15, 50]
    "m5d.metal"     = [15, 50]
    "m5dn.large"    = [3, 10]
    "m5dn.xlarge"   = [4, 15]
    "m5dn.2xlarge"  = [4, 15]
    "m5dn.4xlarge"  = [8, 30]
    "m5dn.8xlarge"  = [8, 30]
    "m5dn.12xlarge" = [8, 30]
    "m5dn.16xlarge" = [15, 50]
    "m5dn.24xlarge" = [15, 50]
    "m5n.large"     = [3, 10]
    "m5n.xlarge"    = [4, 15]
    "m5n.2xlarge"   = [4, 15]
    "m5n.4xlarge"   = [8, 30]
    "m5n.8xlarge"   = [8, 30]
    "m5n.12xlarge"  = [8, 30]
    "m5n.16xlarge"  = [15, 50]
    "m5n.24xlarge"  = [15, 50]
    "m6g.medium"    = [2, 4]
    "m6g.large"     = [3, 10]
    "m6g.xlarge"    = [4, 15]
    "m6g.2xlarge"   = [4, 15]
    "m6g.4xlarge"   = [8, 30]
    "m6g.8xlarge"   = [8, 30]
    "m6g.12xlarge"  = [8, 30]
    "m6g.16xlarge"  = [15, 50]
    "m6g.metal"     = [15, 50]
    "m6gd.medium"   = [2, 4]
    "m6gd.large"    = [3, 10]
    "m6gd.xlarge"   = [4, 15]
    "m6gd.2xlarge"  = [4, 15]
    "m6gd.4xlarge"  = [8, 30]
    "m6gd.8xlarge"  = [8, 30]
    "m6gd.12xlarge" = [8, 30]
    "m6gd.16xlarge" = [15, 50]
    "m6gd.metal"    = [15, 50]
    "p2.xlarge"     = [4, 15]
    "p2.8xlarge"    = [8, 30]
    "p2.16xlarge"   = [8, 30]
    "p3.2xlarge"    = [4, 15]
    "p3.8xlarge"    = [8, 30]
    "p3.16xlarge"   = [8, 30]
    "p3dn.24xlarge" = [15, 50]
    "r3.large"      = [3, 10]
    "r3.xlarge"     = [4, 15]
    "r3.2xlarge"    = [4, 15]
    "r3.4xlarge"    = [8, 30]
    "r3.8xlarge"    = [8, 30]
    "r4.large"      = [3, 10]
    "r4.xlarge"     = [4, 15]
    "r4.2xlarge"    = [4, 15]
    "r4.4xlarge"    = [8, 30]
    "r4.8xlarge"    = [8, 30]
    "r4.16xlarge"   = [15, 50]
    "r5.large"      = [3, 10]
    "r5.xlarge"     = [4, 15]
    "r5.2xlarge"    = [4, 15]
    "r5.4xlarge"    = [8, 30]
    "r5.8xlarge"    = [8, 30]
    "r5.12xlarge"   = [8, 30]
    "r5.16xlarge"   = [15, 50]
    "r5.24xlarge"   = [15, 50]
    "r5.metal"      = [15, 50]
    "r5a.large"     = [3, 10]
    "r5a.xlarge"    = [4, 15]
    "r5a.2xlarge"   = [4, 15]
    "r5a.4xlarge"   = [8, 30]
    "r5a.8xlarge"   = [8, 30]
    "r5a.12xlarge"  = [8, 30]
    "r5a.16xlarge"  = [15, 50]
    "r5a.24xlarge"  = [15, 50]
    "r5ad.large"    = [3, 10]
    "r5ad.xlarge"   = [4, 15]
    "r5ad.2xlarge"  = [4, 15]
    "r5ad.4xlarge"  = [8, 30]
    "r5ad.8xlarge"  = [8, 30]
    "r5ad.12xlarge" = [8, 30]
    "r5ad.16xlarge" = [15, 50]
    "r5ad.24xlarge" = [15, 50]
    "r5d.large"     = [3, 10]
    "r5d.xlarge"    = [4, 15]
    "r5d.2xlarge"   = [4, 15]
    "r5d.4xlarge"   = [8, 30]
    "r5d.8xlarge"   = [8, 30]
    "r5d.12xlarge"  = [8, 30]
    "r5d.16xlarge"  = [15, 50]
    "r5d.24xlarge"  = [15, 50]
    "r5d.metal"     = [15, 50]
    "r5dn.large"    = [3, 10]
    "r5dn.xlarge"   = [4, 15]
    "r5dn.2xlarge"  = [4, 15]
    "r5dn.4xlarge"  = [8, 30]
    "r5dn.8xlarge"  = [8, 30]
    "r5dn.12xlarge" = [8, 30]
    "r5dn.16xlarge" = [15, 50]
    "r5dn.24xlarge" = [15, 50]
    "r5n.large"     = [3, 10]
    "r5n.xlarge"    = [4, 15]
    "r5n.2xlarge"   = [4, 15]
    "r5n.4xlarge"   = [8, 30]
    "r5n.8xlarge"   = [8, 30]
    "r5n.12xlarge"  = [8, 30]
    "r5n.16xlarge"  = [15, 50]
    "r5n.24xlarge"  = [15, 50]
    "r6g.medium"    = [2, 4]
    "r6g.large"     = [3, 10]
    "r6g.xlarge"    = [4, 15]
    "r6g.2xlarge"   = [4, 15]
    "r6g.4xlarge"   = [8, 30]
    "r6g.8xlarge"   = [8, 30]
    "r6g.12xlarge"  = [8, 30]
    "r6g.16xlarge"  = [15, 50]
    "r6g.metal"     = [15, 50]
    "r6gd.medium"   = [2, 4]
    "r6gd.large"    = [3, 10]
    "r6gd.xlarge"   = [4, 15]
    "r6gd.2xlarge"  = [4, 15]
    "r6gd.4xlarge"  = [8, 30]
    "r6gd.8xlarge"  = [8, 30]
    "r6gd.12xlarge" = [8, 30]
    "r6gd.16xlarge" = [15, 50]
    "r6gd.metal"    = [15, 50]
    "t1.micro"      = [2, 2]
    "t2.nano"       = [2, 2]
    "t2.micro"      = [2, 2]
    "t2.small"      = [3, 4]
    "t2.medium"     = [3, 6]
    "t2.large"      = [3, 12]
    "t2.xlarge"     = [3, 15]
    "t2.2xlarge"    = [3, 15]
    "t3.nano"       = [2, 2]
    "t3.micro"      = [2, 2]
    "t3.small"      = [3, 4]
    "t3.medium"     = [3, 6]
    "t3.large"      = [3, 12]
    "t3.xlarge"     = [4, 15]
    "t3.2xlarge"    = [4, 15]
    "t3a.nano"      = [2, 2]
    "t3a.micro"     = [2, 2]
    "t3a.small"     = [2, 4]
    "t3a.medium"    = [3, 6]
    "t3a.large"     = [3, 12]
    "t3a.xlarge"    = [4, 15]
    "t3a.2xlarge"   = [4, 15]
    "t4g.nano"      = [2, 2]
    "t4g.micro"     = [2, 2]
    "t4g.small"     = [2, 4]
    "t4g.medium"    = [3, 6]
    "t4g.large"     = [3, 12]
    "t4g.xlarge"    = [4, 15]
    "t4g.2xlarge"   = [4, 15]
    "u-6tb1.metal"  = [5, 30]
    "u-9tb1.metal"  = [5, 30]
    "u-12tb1.metal" = [5, 30]
    "u-18tb1.metal" = [15, 50]
    "u-24tb1.metal" = [15, 50]
    "x1.16xlarge"   = [8, 30]
    "x1.32xlarge"   = [8, 30]
    "x1e.xlarge"    = [3, 10]
    "x1e.2xlarge"   = [4, 15]
    "x1e.4xlarge"   = [4, 15]
    "x1e.8xlarge"   = [4, 15]
    "x1e.16xlarge"  = [8, 30]
    "x1e.32xlarge"  = [8, 30]
    "z1d.large"     = [3, 10]
    "z1d.xlarge"    = [4, 15]
    "z1d.2xlarge"   = [4, 15]
    "z1d.3xlarge"   = [8, 30]
    "z1d.6xlarge"   = [8, 30]
    "z1d.12xlarge"  = [15, 50]
    "z1d.metal"     = [15, 50]
  }
}
