namespace dragonBones {

    export class PhaserTextureAtlasData extends TextureAtlasData {
        public static toString(): string {
            return "[class dragonBones.PhaserTextureAtlasData]";
        }
        public texture: PIXI.BaseTexture;
        public constructor() {
            super();
        }
        protected _onClear(): void {
            super._onClear();

            if (this.texture) {
                this.texture = null;
            }
        }
        /**
         * @private
         */
        public generateTextureData(): TextureData {
            return BaseObject.borrowObject(PhaserTextureData);
        }
    }

    export class PhaserTextureData extends TextureData {
        public static toString(): string {
            return "[class dragonBones.PhaserTextureData]";
        }

        public texture: PIXI.Texture;

        public constructor() {
            super();
        }
        /**
         * @inheritDoc
         */
        protected _onClear(): void {
            super._onClear();

            if (this.texture) {
                this.texture.destroy(false);
                this.texture = null;
            }
        }
    }

}