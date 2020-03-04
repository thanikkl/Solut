class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_media, dependent: :destroy
  has_many :user_instruments
  has_many :instruments, through: :user_instruments
  has_many :events, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :contact_requests, dependent: :destroy
  has_one_attached :profile_picture

  validates :nick_name, presence: true, uniqueness: true

  PROFILE_ARRAY =
      [
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1582295056/gbt7jg0gvydget8frma683dkbs4p.png",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096606/56273264_fmhm7r.jpg",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096606/56685868_knl7qf.jpg",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096606/37003066_dbwhja.jpg",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/57906639_fyocpe.jpg",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/virginia_yhdfzm.jpg",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/57413508_hzq4oq.png",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096606/12401398_q6dhun.png",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096606/54674053_er71me.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/58860498_mpjdxt.jpg",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/54706761_kq2fth.png",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/58111221_g7xyk6.jpg",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/58396604_h7tkkg.png",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098624/57566457_afsezx.png",
      'https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098622/57886741_nfdauk.jpg',
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098622/58146349_ndrzqa.jpg",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098622/59102138_ioglxm.jpg",
      "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096606/37003066_dbwhja.jpg"
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/57906639_fyocpe.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/virginia_yhdfzm.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/57413508_hzq4oq.png",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096606/12401398_q6dhun.png",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096606/54674053_er71me.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/58860498_mpjdxt.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/54706761_kq2fth.png",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/58111221_g7xyk6.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583096607/58396604_h7tkkg.png",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098624/57566457_afsezx.png",
      # 'https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098622/57886741_nfdauk.jpg',
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098622/58146349_ndrzqa.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098622/59102138_ioglxm.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098622/58467989_jozdrk.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098621/57875309_ce40q9.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098621/57684898_ncwrcy.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098620/57362703_mngbtw.png",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098620/57675917_jj3cqv.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098620/57488132_ok24ts.png",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098620/57488471_r1glwg.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098618/57323528_ttxu8d.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098617/55975612_xpdmma.png",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098616/57186441_yymdpf.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098616/56929166_elwghd.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098616/54189912_bzehoh.png",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098616/56845288_gzoh4o.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098616/56045373_u0axys.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098615/55446352_b0ahtf.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098615/55874437_gpwcjv.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098615/55749901_lfgzks.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098614/55212926_ahc6dn.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098614/54713861_kzktmc.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098614/53785739_ktarzh.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098614/34398918_s6kola.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098614/52860039_l6rnmb.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098614/1598346_c0oajp.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098613/50026436_ztonf6.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098613/50026355_x4ljwg.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098613/6177564_vmx5cl.jpg",
      # "https://res.cloudinary.com/dh8tpzykj/image/upload/v1583098613/12762571_wx2esj.jpg"
      ]

    def participation(event)
      self.contact_requests.find_by(event_id: event.id)
    end

 end
